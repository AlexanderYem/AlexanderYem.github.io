/// Created by Alexander Yemelyanov on 17.01.2020.
import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    4040,
  );
  print('Listening on ${server.port}');

  // #docregion listen
  await for (HttpRequest request in server) {
    print(request.method+" "+request.requestedUri.path);

    if(request.requestedUri.path == '/register') {
      if(request.method == 'POST') {
        String s = await File('services/register.json').readAsString();
        request.response.write(s);
      } else request.response.statusCode = 405;      
    } else {
      request.response.write('Hello, world!');
    }
    await request.response.close();
  }
  // #enddocregion listen
}