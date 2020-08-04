import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/testing/ComandosPageTest.dart';
import 'package:test_flutter_websockets/testing/GeneralPageTest.dart';
import 'package:test_flutter_websockets/testing/GraficosPageTest.dart';
import 'package:test_flutter_websockets/testing/ModulosTestPage.dart';


class DeviceMenuPage extends StatefulWidget {
  @override
  _DeviceMenuPageState createState() => _DeviceMenuPageState();
}

class _DeviceMenuPageState extends State<DeviceMenuPage> {

  // Controlador de pagina
  int _currentIndex = 0;
  PageController _pageController;
    @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
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
        title: Text('Mi casa'), 
        backgroundColor: Colors.black54, 
        actions: <Widget>[IconButton(icon: Icon(Icons.edit, size: 30,), onPressed: (){})],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linearToEaseOut);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('General'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Modulos'),
            icon: Icon(Icons.developer_board),
          ),
          BottomNavigationBarItem(
            title: Text('Gráficos'),
            icon: Icon(Icons.insert_chart),
          ),
          BottomNavigationBarItem(
            title: Text('Ajustes'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        child: SizedBox.expand(
          child: PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              GeneralPageTest(),
              // Container(child: Center(child: Text('General', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
              ModulosTestPage(),
              // Container(child: Center(child: Text('Modulos', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
              // Container(child: Center(child: Text('Graficos', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
              GraficosPageTest(),
              Container(child: Center(child: Text('Ajustes', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
            ],
          ),
        ),
      ),
    );
  }
}