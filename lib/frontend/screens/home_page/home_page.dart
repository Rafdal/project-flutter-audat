import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/AppBarTitle.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/SettingsButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Controlador de pagina
  int _currentIndex = 1;
  PageController _pageController;
    @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarTitle(), backgroundColor: Colors.white, actions: <Widget>[SettingsButton()],),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
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
            title: Text('Inicio'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Módulos'),
            icon: Icon(Icons.developer_board),
          ),
          BottomNavigationBarItem(
            title: Text('Ayuda'),
            icon: Icon(Icons.help),
          ),
        ],
      ),
    );
  }
}