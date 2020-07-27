import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key key}) : super(key: key);

  final Shadow shadow = const Shadow(
    color: Colors.black54,
    offset: Offset(0, 1),
    blurRadius: 3
  );

  final double size = 38;

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(text: 'Au', style: TextStyle(
          fontFamily: '3ds', 
          fontSize: size,
          color: Color.fromRGBO(120, 120, 120, 1),
          shadows: [shadow]
        )),
        TextSpan(text: 'dat ', style: TextStyle(
          fontFamily: '3ds', 
          fontSize: size,
          color: Colors.lightBlue,
          shadows: [shadow]
        )),
        TextSpan(text: 'App', style: TextStyle(
          fontFamily: 'Montserrat', 
          fontStyle: FontStyle.italic,
          letterSpacing: -0.5,
          fontSize: 30,
          color: Colors.grey.withOpacity(0.6),
          // shadows: [shadow]
        )),
      ]
    ));
  }
}