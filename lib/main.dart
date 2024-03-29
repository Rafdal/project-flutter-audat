import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_websockets/backend/websocket.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/home_page.dart';

import 'package:test_flutter_websockets/frontend/screens/loading_page/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {

    // Configuración inicial WebSocket (Con mi wrapper)
    WebSocket ws = WebSocket(host: '192.168.0.184', port: 3000);
    ws.init();
    ws.on('connect', (_){
      print('WS Connected');
    });

    // ! TEST
    ws.on('module:control', (data){ 
      print('[CONTROL PACKET]: $data');
    });

    final getIt = GetIt.instance;
    getIt.registerSingleton<WebSocket>(ws); // Guardo el objeto para poder acceder desde otros widgets sin tener que pasarlo como parámetro

    runApp(MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.blue,
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