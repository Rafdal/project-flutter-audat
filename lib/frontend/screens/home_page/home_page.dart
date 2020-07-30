import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/AppBarTitle.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/MenuButton.dart';
import 'package:test_flutter_websockets/frontend/screens/home_page/widgets/SettingsButton.dart';
import 'package:test_flutter_websockets/frontend/screens/modulos_page/modulos_page.dart';
import 'package:test_flutter_websockets/frontend/widgets/AudatButton.dart';

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
      appBar: AppBar(
        title: AppBarTitle(), centerTitle: true, backgroundColor: Colors.white, 
        actions: <Widget>[SettingsButton()], 
        leading: MenuButton(),
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(),
            ModulosPage(),
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
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Modules'),
            icon: Icon(Icons.developer_board),
          ),
          BottomNavigationBarItem(
            title: Text('Help'),
            icon: Icon(Icons.help),
          ),
        ],
      ),
    );
  }
}