import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/home_page.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:test_flutter_websockets/frontend/screens/loading_page/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {

    // @ WEB SOCKET
    IO.Socket socket = IO.io('http://192.168.1.114:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      // 'extraHeaders': {'foo': 'bar'} // optional
    });

    socket.on('connect', (_) {
      print('connect');
    });

    socket.on('event', (data) => print(data));
    // socket.on('chat:mensaje', (data) => print('socket mensaje: $data'));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));

    runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyHomePage(socket: socket,),
        // '/welcome': (context) => WelcomePage(),
      },
    ));
  });
}