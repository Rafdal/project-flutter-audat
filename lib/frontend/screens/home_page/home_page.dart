import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/screens/Devices/devices_page/devices_page.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/AppBarTitle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageController;
    @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 3);
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
          Container(child: Center(child: Text('Inicio', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          Container(child: Center(child: Text('Perfil', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          Container(child: Center(child: Text('Amigos', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          DevicesPage(),
          Container(child: Center(child: Text('Automatización', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          Container(child: Center(child: Text('Configuración', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          Container(child: Center(child: Text('Información', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
          Container(child: Center(child: Text('Ayuda', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
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
            CustomMenuTile(0, 'Inicio', Icons.home, _pageController),
            Divider(),
            CustomMenuTile(1, 'Tu perfil', Icons.person, _pageController),
            CustomMenuTile(2 ,'Amigos', Icons.group, _pageController),
            Divider(),
            CustomMenuTile(3 ,'Dispositivos', Icons.view_list, _pageController),
            CustomMenuTile(4 ,'Automatización', Icons.functions, _pageController),
            CustomMenuTile(5 ,'Configuración', Icons.settings, _pageController),
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
        title: Text(title, style: TextStyle(
          fontWeight: id == 0 ? FontWeight.w800 : null, 
          color: id == 0 && id != controller.page  ? Color.fromRGBO(120, 120, 120, 1) : null,
        ),),
        leading: Icon(icon, color: id == 0 && id != controller.page ? Color.fromRGBO(80, 80, 80, 1) : null,),
        selected: id == controller.page,
      ),
    );
  }
}