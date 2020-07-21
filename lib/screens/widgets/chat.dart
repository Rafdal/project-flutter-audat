import 'package:flutter/material.dart';


class ChatWindow extends StatefulWidget {

  final List<String> user;
  final List<String> message;

  ChatWindow({
    this.user = const <String>[], 
    this.message = const <String>[],
  });

  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {  


  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.message.length,
          itemBuilder: (context,idx){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: <Widget>[
                Text('${widget.user[idx]}: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(widget.message[idx], style: TextStyle(color: Colors.black54),)
              ],),
            );
          }
        ),
      )
    );
  }
}