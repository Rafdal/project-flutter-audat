import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_websockets/backend/websocket.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/home_page.dart';

import 'package:test_flutter_websockets/frontend/screens/loading_page/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {

    // @ Configuración inicial WebSocket
    WebSocket ws = WebSocket(host: '192.168.1.114', port: 3000);
    ws.init();
    ws.on('connect', (_){
      print('Connected');
    });

    final getIt = GetIt.instance;
    getIt.registerSingleton<WebSocket>(ws); // Guardo el objeto para poder acceder desde otros widgets sin tener que pasarlo como parámetro

    runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomePage(),
        // '/welcome': (context) => WelcomePage(),
      },
    ));
  });
}