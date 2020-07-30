import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/AppBarTitle.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/MenuButton.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/SettingsButton.dart';
import 'package:test_flutter_websockets/frontend/screens/Modulos/modulos_page/modulos_page.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int menuId = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispositivos', style: TextStyle(color: Colors.grey),), centerTitle: true, backgroundColor: Colors.white, 
        // actions: <Widget>[SettingsButton()], 
        iconTheme: IconThemeData(color: Colors.grey),
        // leading: MenuButton(),
      ),
      body: ModulosPage(),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      drawerEdgeDragWidth: 35,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // DrawerHeader(child: , margin: EdgeInsets.zero,),
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18, bottom: 14),
                child: AppBarTitle(title: 'App',),
              ),
            ),
            // Divider(thickness: 1.5,),
            CustomMenuTile(0, 'Tu perfil', Icons.person, menuId, (){

            }),
            CustomMenuTile(1 ,'Amigos', Icons.group, menuId, (){

            }),
            Divider(),
            CustomMenuTile(2 ,'Dispositivos', Icons.view_list, menuId, (){

            }),
            CustomMenuTile(3 ,'Automatización', Icons.functions, menuId, (){

            }),
            CustomMenuTile(4 ,'Configuración', Icons.settings, menuId, (){

            }),
            CustomMenuTile(5 ,'Seguridad', Icons.security, menuId, (){

            }),
            Divider(),
            CustomMenuTile(6 ,'Información', Icons.info_outline, menuId, (){

            }),
            CustomMenuTile(7 ,'Ayuda', Icons.help_outline, menuId, (){

            }),
          ],
        ),
      ),
    );
  }
}

class CustomMenuTile extends StatelessWidget {

  String title;
  IconData icon;
  Function onTap;
  bool selected;
  int id, currentId;

  CustomMenuTile(this.id, this.title, this.icon, this.currentId, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.lightBlueAccent,
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        selected: id == currentId,
      ),
    );
  }
}