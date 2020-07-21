import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  MessageInput({Key key, this.onSubimitted, this.controller}) : super(key: key);

  final ValueChanged<String> onSubimitted;
  final TextEditingController controller;

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          hoverColor: Colors.green.withOpacity(0.4),
          focusColor: Colors.white,
          hintText: "Mensaje",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey[300]),
          ),
        ),
        style: TextStyle(fontSize: 15),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          widget.onSubimitted(value);
        }
      ),
    );
  }
}