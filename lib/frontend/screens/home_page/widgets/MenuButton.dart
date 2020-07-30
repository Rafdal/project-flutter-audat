import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Colors.grey, size: 28,), 
      onPressed: (){

      }
    );
  }
}