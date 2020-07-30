import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_websockets/backend/ModuleControl/ModuleControl.dart';
import 'package:test_flutter_websockets/backend/websocket.dart';
import 'package:test_flutter_websockets/frontend/classes/AudatButtonData.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatButton.dart';

class ModulosPage extends StatefulWidget {
  @override
  _ModulosPageState createState() => _ModulosPageState();
}

class _ModulosPageState extends State<ModulosPage> {

  AudatButtonData btnData = AudatButtonData(
    radius: 15, 
    paddingExt: EdgeInsets.all(5),
    paddingInt: EdgeInsets.all(10),
  );

  WebSocket ws = GetIt.I<WebSocket>();

  @override
  void initState() { 
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),  
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Módulo de control', style: TextStyle(color: Colors.grey.withOpacity(0.8)),),
                Row(
                  children: <Widget>[
                    AudatButton(
                      child: Icon(Icons.power_settings_new, size: 30,),
                      audatButtonData: btnData,
                      onPressed: (){
                        ws.emit('module:control');
                      },
                    ),
                    AudatButton(
                      child: Text('Registro',),
                      audatButtonData: btnData.copyWith(textColor: Colors.blue),
                      onPressed: (){
                        Map<String, dynamic> map = {
                          "user": "Rafa",
                          "hardId": 'E32-2594-V806F'
                        };
                        ws.emit('module:connect', jsonEncode(map));
                      },
                    ),
                    AudatButton(
                      child: Text('Control',),
                      audatButtonData: btnData.copyWith(textColor: Colors.orange),
                      onPressed: (){

                        // datos random de ejemplo
                        int commandId = 0;
                        List<dynamic> data = [1];

                        ModuleControl(
                          user: 'Rafa',
                          pass: '12345678',
                          hardwareId: 'E32-2594-V806F',
                        ).sendTo(6, commandId, packet: data);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 100,),
        Text('Qué onda gente?', style: TextStyle(color: Colors.grey.withOpacity(0.8)),)
      ],),
    );
  }
}