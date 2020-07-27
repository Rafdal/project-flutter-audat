import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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