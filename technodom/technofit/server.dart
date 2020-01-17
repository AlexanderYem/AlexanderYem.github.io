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
  print('Listening on ${server.port}');

  // #docregion listen
  await for (HttpRequest request in server) {
    print(request.method+" "+request.requestedUri.path+"\n${request.headers.toString()}");

    String body;

    if(request.method == 'POST') {
      body = await utf8.decoder.bind(request).join();
      print("body: $body");
    }

    if(request.requestedUri.path == '/register') {
      if(request.method == 'POST') {
        if(Random().nextBool()) request.response.write(await File('services/register.json').readAsString());
        else request.response.write(await File('services/register_error.json').readAsString());
      } else request.response.statusCode = 405;
    } else {
      request.response.write('Hello, world!');
    }
    print("\n");
    await request.response.close();
  }
  // #enddocregion listen
}