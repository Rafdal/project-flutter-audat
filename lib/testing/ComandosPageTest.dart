import 'package:flutter/cupertino.dart';
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

  AudatButtonData bottomBtnData = AudatButtonData(
    outlined: true, 
    paddingInt: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
    background: null,
    textSize: 16,
    radius: 25
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Mi casa'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: Icon(Icons.lightbulb_outline, size: 40,),
                  title: Text('Luz habitacion', style: TextStyle(fontSize: 22, color: Colors.black54, fontWeight: FontWeight.w500),),
                  subtitle: Text('Modulo interruptor', style: TextStyle(fontSize: 16, color: Colors.grey),),
                  onTap: (){},
                ),
              ),
            ),
            Divider(height: 1,),
            Container(
              height: 365,
              // color: Colors.red.withOpacity(0.1),
              child: SafeArea(
                child: false ? Placeholder() : GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
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
                    AudatIconSwitch(
                      activeText: 'ON',
                      activeColor: Colors.white,
                      inactiveText: 'OFF',
                      inactiveColor: Colors.black54,
                      backgroundActive: Colors.lightBlueAccent,
                      backgroundInactive: Colors.grey,
                      paddingExt: buttonData.paddingExt,
                      radius: buttonData.radius,
                      splash: Colors.blueAccent,
                      activeSplash: Colors.white,
                      fontSize: 26,
                      value: status, 
                      onChanged: (val){
                        setState(() {
                          status = val;
                          ModuleControl(
                            user: 'Rafa',
                            pass: '1234567',
                            hardwareId: '3C:71:BF:FF:76:3C',
                          ).sendTo(3, 0);
                        });
                      }
                    ),
                    AudatButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.circle_filled,
                            size: 60,
                            color: Colors.orangeAccent,
                          ),
                          Text('Color', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      audatButtonData: buttonData,
                      onPressed: (){}
                    ),
                    AudatIconSwitch(
                      onChanged: (val){}, 
                      value: false,
                      paddingExt: buttonData.paddingExt,
                      radius: buttonData.radius,
                      inactiveIcon: Icons.functions,
                      iconSize: 60,
                      inactiveText: 'Funciones',
                      fontSize: 16,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AudatButton(
                      onPressed: (){}, 
                      audatButtonData: bottomBtnData,
                      child: Text('Estadisticas'),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: AudatButton(
                      onPressed: (){}, 
                      audatButtonData: bottomBtnData,
                      child: Text('Configuracion'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}