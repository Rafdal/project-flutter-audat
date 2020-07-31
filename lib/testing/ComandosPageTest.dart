import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_websockets/frontend/classes/AudatButtonData.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatButton.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatIconSwitch.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatSwitch/AudatSwitch.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatSwitchButton.dart';


class ComandosPageTest extends StatefulWidget {
  @override
  _ComandosPageTestState createState() => _ComandosPageTestState();
}

class _ComandosPageTestState extends State<ComandosPageTest> {

  bool status=false;

  AudatButtonData buttonData = AudatButtonData(radius: 20, paddingExt: EdgeInsets.all(5));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline, size: 40,),
                title: Text('Luz patio', style: TextStyle(fontSize: 22, color: Colors.black54, fontWeight: FontWeight.w500),),
                subtitle: Text('Modulo interruptor', style: TextStyle(fontSize: 16, color: Colors.grey),),
                onTap: (){},
              ),
            ),
          ),
          Divider(height: 1,),
          Expanded(
            child: Container(
              child: SafeArea(
                child: false ? Placeholder() : GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Text('Encender'),
                        AudatSwitch(
                          activeColor: Colors.lightBlueAccent,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ],
                    ),
                    AudatIconSwitch(value: status, 
                      onChanged: (val){
                        setState(() {
                          status = val;
                        });
                      },
                      fontWeight: FontWeight.w500,
                      activeIcon: Icons.timer,
                      inactiveIcon: Icons.timer_off,
                      // activeColor: Colors.lightBlueAccent,
                      // inactiveColor: Colors.grey,
                      radius: buttonData.radius,
                      paddingExt: buttonData.paddingExt,
                      iconSize: 60,
                      activeText: 'Timer',
                      inactiveText: 'Timer',
                    ),
                    /* AudatSwitchButton(
                      value: status,
                      activeChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.timer, size: 50, color: Colors.lightBlueAccent,),
                          Text('Timers'),
                        ],
                      ),
                      inactiveChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.timer_off, size: 50,),
                          Text('Timers'),
                        ],
                      ),
                      activeBtnData: buttonData.copyWith(textColor: Colors.lightBlueAccent, splash: Colors.grey),
                      inactiveBtnData: buttonData.copyWith(splash: Colors.lightBlueAccent),
                      onChanged: (val){
                        
                      }, 
                    ), */
                    AudatButton(
                      child: Text('Configuración'),
                      audatButtonData: buttonData,
                      onPressed: (){}, 
                    ),
                    AudatSwitchButton(
                      activeBtnData: buttonData.copyWith(background: Colors.lightBlueAccent, textColor: Colors.white, textSize: 25),
                      inactiveBtnData: buttonData.copyWith(background: Colors.grey, textColor: Colors.black54, textSize: 25),
                      value: status, 
                      activeChild: Text('ON'),
                      inactiveChild: Text('OFF'),
                      onChanged: (val){
                        setState(() {
                          status = val;
                        });
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                
                ,
              ],
            ),
          ), */
        ],
      ),
    );
  }
}