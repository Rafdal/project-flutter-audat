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

  int _menuIndex = 2;
  PageController _pageController;
    @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispositivos', style: TextStyle(color: Colors.grey),), centerTitle: true, backgroundColor: Colors.white, 
        // actions: <Widget>[SettingsButton()], 
        iconTheme: IconThemeData(color: Colors.grey),
        // leading: MenuButton(),
      ),
      // body: ModulosPage(),
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        /* onPageChanged: (index) {
          setState(() => _menuIndex = index);
        }, */
        children: <Widget>[
          Container(),
          Container(),
          ModulosPage(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      drawerEdgeDragWidth: 35,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // DrawerHeader(child: , margin: EdgeInsets.zero,),
            Container(
              color: Colors.white, //.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18, bottom: 14),
                child: AppBarTitle(title: 'App',),
              ),
            ),
            // Divider(thickness: 1.5,),
            CustomMenuTile(0, 'Tu perfil', Icons.person, _pageController),
            CustomMenuTile(1 ,'Amigos', Icons.group, _pageController),
            Divider(),
            CustomMenuTile(2 ,'Dispositivos', Icons.view_list, _pageController),
            CustomMenuTile(3 ,'Automatización', Icons.functions, _pageController),
            CustomMenuTile(4 ,'Configuración', Icons.settings, _pageController),
            Divider(),
            CustomMenuTile(6 ,'Información', Icons.info_outline, _pageController),
            CustomMenuTile(7 ,'Ayuda', Icons.help_outline, _pageController),
          ],
        ),
      ),
    );
  }
}

class CustomMenuTile extends StatelessWidget {

  String title;
  IconData icon;
  bool selected;
  int id;
  PageController controller;

  CustomMenuTile(this.id, this.title, this.icon, this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.lightBlueAccent,
      onTap: (){
        controller.jumpToPage(id);
        Navigator.of(context).pop();
      },
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        selected: id == controller.page,
      ),
    );
  }
}