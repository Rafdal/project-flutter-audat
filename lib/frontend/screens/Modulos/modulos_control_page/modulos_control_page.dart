import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/testing/ComandosPageTest.dart';


class ModulosControlPage extends StatefulWidget {
  @override
  _ModulosControlPageState createState() => _ModulosControlPageState();
}

class _ModulosControlPageState extends State<ModulosControlPage> {

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
      appBar: AppBar(title: Text('Central de control'), backgroundColor: Colors.black54,),
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
      body: Stack(
        children: <Widget>[
          Container(
            child: SizedBox.expand(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: <Widget>[
                  ComandosPageTest(),
                  // Container(child: Center(child: Text('General', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
                  Container(child: Center(child: Text('Modulos', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
                  Container(child: Center(child: Text('Graficos', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
                  Container(child: Center(child: Text('Ajustes', style: TextStyle(fontSize: 30, color: Colors.grey),),),),
                ],
              ),
            ),
          ),
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
      ),
    );
  }
}