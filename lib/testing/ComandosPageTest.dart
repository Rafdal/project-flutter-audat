import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_websockets/backend/ModuleControl/ModuleControl.dart';
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

  bool timer=false;
  bool relay=false;
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
                          value: relay,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              relay = value;
                            });
                          },
                        ),
                      ],
                    ),
                    AudatIconSwitch(value: timer, 
                      onChanged: (val){
                        setState(() {
                          timer = val;
                        });
                      },
                      fontWeight: FontWeight.w500,
                      activeIcon: Icons.timer,
                      inactiveIcon: Icons.timer_off,
                      activeSplash: Colors.grey,
                      radius: buttonData.radius,
                      paddingExt: buttonData.paddingExt,
                      iconSize: 60,
                      activeText: 'Timer',
                      inactiveText: 'Timer',
                      fontSize: 16,
                    ),
                    AudatButton(
                      child: Text('Configuración'),
                      audatButtonData: buttonData,
                      onPressed: (){}, 
                    ),
                    AudatIconSwitch(
                      activeText: 'ON',
                      activeColor: Colors.white,
                      inactiveText: 'OFF',
                      inactiveColor: Colors.black54,
                      backgroundActive: Colors.lightBlueAccent,
                      backgroundInactive: Colors.grey,
                      paddingExt: buttonData.paddingExt,
                      radius: buttonData.radius,
                      splash: Colors.lightBlueAccent,
                      activeSplash: Colors.white,
                      fontSize: 26,
                      value: status, 
                      onChanged: (val){
                        setState(() {
                          status = val;
                          ModuleControl(
                            user: 'Rafa',
                            pass: '1234567',
                            hardwareId: 'asddsgfjdnasd',
                          ).sendTo(3, 0);
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