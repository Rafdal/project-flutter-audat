import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_websockets/backend/websocket.dart';
import 'package:test_flutter_websockets/frontend/screens/chat_room/widgets/chat.dart';
import 'package:test_flutter_websockets/frontend/screens/chat_room/widgets/message.dart';
import 'package:test_flutter_websockets/frontend/screens/chat_room/widgets/username.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({Key key}) : super(key: key);


  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  List<String> users = [];
  List<String> messages = [];

  String user, message;

  WebSocket ws = GetIt.I<WebSocket>();

  var _controller = TextEditingController();

  @override
  void initState() { 
    super.initState();
    ws.on('chat:mensaje', (data){
      setState(() {
        users.add(data['username']);
        messages.add(data['message']);
        print('socket mensaje: $data');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSockets testing chat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: UsernameInput(onSubimitted: (val){user=val;},),
          ),
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(''),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RawMaterialButton(
                    onPressed: (){
                      setState(() {
                        messages = <String>[];
                        users = <String>[];
                      });
                    },
                    constraints: BoxConstraints(),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid, width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                      child: Text('Borrar', style: TextStyle(fontSize: 15)),
                    ),
                    padding: EdgeInsets.all(0),
                  ),
                )
              ],
            ),
          ),
          ChatWindow(user: users, message: messages),
          Container(
            color: CupertinoColors.lightBackgroundGray,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: Row(
                children: <Widget>[
                  Expanded(child: MessageInput(onSubimitted: (val){message=val;}, controller: _controller,)),
                  IconButton(
                    onPressed: (){
                      if (message != null && user != null) {
                        setState(() {
                          Map packet = {
                            'username': user,
                            'message': message
                          };
                          ws.emit('chat:mensaje', packet);
                          _controller.clear();
                          message = null;
                        });
                      }
                    },
                    icon: Icon(Icons.send),
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}