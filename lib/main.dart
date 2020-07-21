import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_flutter_websockets/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {

  runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyHomePage(),
        // '/welcome': (context) => WelcomePage(),
      },
    ));
  });
}

class Loading extends StatefulWidget {

  
  Loading();

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() { 
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /* SizedBox(height: 100,),
              Flexible(
                child: Container(
                  // color: Colors.green.withOpacity(0.4),
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      appLogoLoading
                    ],
                  ),
                ),
              ), */
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 55.0),
                child: SpinKitChasingDots(
                  color: Colors.blue,
                  size: 50,
                ),
                // CircularProgressIndicator()
              )
            ],
          ),
        ),
      ),
    );
  }
}