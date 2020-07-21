import 'package:flutter/material.dart';

class UsernameInput extends StatefulWidget {
  const UsernameInput({Key key, this.onSubimitted}) : super(key: key);

  final ValueChanged<String> onSubimitted;

  @override
  _UsernameInputState createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.white38,
          hoverColor: Colors.green.withOpacity(0.4),
          focusColor: Colors.white70,
          hintText: "Usuario",
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
