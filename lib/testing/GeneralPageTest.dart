import 'package:flutter/material.dart';


class GeneralPageTest extends StatelessWidget {

  final TextStyle style = TextStyle(color: Colors.grey, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    // leading: Icon(Icons.home, size: 40,),
                    title: Text('Mi casa', style: TextStyle(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.w500),),
                    // subtitle: Text('Central de control', style: TextStyle(fontSize: 18, color: Colors.grey),),
                    trailing: Icon(Icons.edit, size: 30,),
                    onTap: (){},
                  ),
                  Divider(height: 5, indent: 20, endIndent: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Info de red de modulos', style: style.copyWith(fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 8,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Registrados:', style: style,),
                            SizedBox(width: 20,),
                            Text('2', style: style,)
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('En linea:', style: style,),
                            SizedBox(width: 20,),
                            Text('2', style: style,)
                          ],
                        ),
                        /* Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Cantidad de modulos:', style: style,),
                            SizedBox(width: 20,),
                            Text('2', style: style,)
                          ],
                        ), */
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Divider(height: 1,),
        ]
      )
    );
  }
}