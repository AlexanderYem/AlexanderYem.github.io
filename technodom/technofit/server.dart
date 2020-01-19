import 'dart:convert';
/// Created by Alexander Yemelyanov on 17.01.2020.
import 'dart:io';

import 'dart:math';

/// Mini server for testing purposes

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    4040,
  );

  String bearer = json.decode(await File('services/auth.json').readAsString())["bearer"];

  print('Listening on ${server.port} (bearer: $bearer)');

  // #docregion listen
  await for (HttpRequest request in server) {
    print(request.method+" "+request.requestedUri.path+"\n${request.headers.toString()}");

    String body;

    if(request.method == 'POST') {
      body = await utf8.decoder.bind(request).join();
      print("body: $body");
    }

    bool auth() {
      if(bearer == null || request.headers.value("authorization")!="Bearer $bearer") {
        request.response.statusCode = 401;
        print("Response: 41 not authorized (${request.headers.value("authorization")})");
        return false;
      }
      return true;
    }

    if(request.requestedUri.path == '/register') {
      if(request.method == 'POST') {
        if(Random().nextBool()) request.response.write(await File('services/base_response.json').readAsString()); // ok
        else request.response.write(await File('services/register_error.json').readAsString());                   // error
      } else request.response.statusCode = 405;
    } else if(request.requestedUri.path == '/request_sms_code') {
      if(request.method == 'POST') {
        if(Random().nextBool()) request.response.write(await File('services/base_response.json').readAsString()); // ok
        else request.response.write(await File('services/request_sms_code_error.json').readAsString());           // error
      } else request.response.statusCode = 405;
    } else if(request.requestedUri.path == '/auth') {
      if(request.method == 'POST') {
        if(Random().nextBool()) request.response.write(await File('services/auth.json').readAsString()); // ok
        else request.response.write(await File('services/auth_error.json').readAsString());              // error
      } else request.response.statusCode = 405;
    } else if(request.requestedUri.path == '/request_bonus') {
      if(auth()) {
        if (request.method == 'POST') {
          if (Random().nextBool()) request.response.write(
              await File('services/bonus.json').readAsString()); // ok
          else
            request.response.write(
                await File('services/base_response_error.json')
                    .readAsString()); // error
        } else
          request.response.statusCode = 405;
      }
    } else {
      request.response.write('Hello, world!');
    }
    print("\n");
    await request.response.close();
  }
  // #enddocregion listen
}