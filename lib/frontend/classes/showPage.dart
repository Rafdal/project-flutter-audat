import 'package:flutter/material.dart';


/* 
 * Esta funcion sirve para Pushear una nueva pagina (Widget) encima del stack
 * 
 * Ademas agrega un detector de gestos para volver a la pagina anterior con un Navigator.pop()
 */


void  showPage(BuildContext context, Widget page) {
  Navigator.push(context,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutSine;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: WrapperPage(child: child,),
        );
      }
    )
    /* new MaterialPageRoute(builder: (BuildContext context){
      return page;
    }) */
  );
}

class WrapperPage extends StatelessWidget {

  final Widget child;

  const WrapperPage({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Container(width: 35, 
          child: GestureDetector(
            child: Container(color: Colors.transparent,), 
            onPanUpdate: (drag){
              if (drag.delta.dx > 3) {
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}