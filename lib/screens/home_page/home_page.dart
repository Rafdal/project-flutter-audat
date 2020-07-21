import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/screens/home_page/widgets/chat.dart';
import 'package:test_flutter_websockets/screens/home_page/widgets/message.dart';
import 'package:test_flutter_websockets/screens/home_page/widgets/username.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> users = [];
  List<String> messages = [];

  String user, message;

  var _controller = TextEditingController();

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
                      child: Text('Clear', style: TextStyle(fontSize: 15)),
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
                          users.add(user);
                          messages.add(message);
                          print('msg: $message, user: $user');
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