 import 'package:socket_io_client/socket_io_client.dart' as IO;
 
// ! WRAPPER de la libreria WebSocket


class WebSocket {

  IO.Socket socket;

  /* static final WebSocket instance = WebSocket._internal();
  WebSocket._internal();

  factory WebSocket()=>instance; */
  
  final String host;
  final int port;

  WebSocket({
    this.host,
    this.port
  });

  void init(){
    socket = IO.io('http://$host:$port', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      // 'extraHeaders': {'foo': 'bar'} // optional
    });
  }

  void on(dynamic event, dynamic Function(dynamic data) callback){
    socket.on(event, callback);
  }

  void emit(String event, [dynamic data]){
    socket.emit(event,data);
  }


  // socket.on('event', (data) => print(data));
  // // socket.on('chat:mensaje', (data) => print('socket mensaje: $data'));
  // socket.on('disconnect', (_) => print('disconnect'));
  // socket.on('fromServer', (_) => print(_));
}