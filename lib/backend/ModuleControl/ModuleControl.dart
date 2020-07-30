import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_websockets/backend/websocket.dart';

/* 
 * Esta clase es usada como interfaz de control para los modulos
 */

class ModuleControl {

  // Objeto global de WebSocket
  WebSocket _ws = GetIt.I<WebSocket>();

  final String user, pass, hardwareId;

  ModuleControl({
    this.user,
    this.pass,
    this.hardwareId,
  });

  /* Map toMap(String passHashed) => {
    "user": user,
    "pw": passHashed,
    "hardId": hardwareId,
  }; */

  void sendTo(int moduleId, int commandId, {dynamic packet}){
    var passHashed = sha256.convert(utf8.encode(pass));

    Map<String, dynamic> map = {
      "user": user,
      "pw": passHashed.toString(),
      "hardId": hardwareId,
      "packet": {
        "modId": moduleId,
        "commId" : commandId,
        "data": packet,
      }
    };

    String jsonStr = json.encode(map);
    print(jsonStr);
    _ws.emit('module:control', jsonStr);
  }

}