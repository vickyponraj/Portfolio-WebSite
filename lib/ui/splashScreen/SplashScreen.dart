
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_001/ui/dashBoard/DashBoardScreen.dart';
import 'package:flutter_web_001/ui/homeScreen/HomeScreen.dart';
import 'package:flutter_web_001/values/AppAssets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenWidget();
  }
}


class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.appPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppAssets.profilePic,
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  Strings.appDescription,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.all(20),
                child: LinearProgressIndicator(
                    backgroundColor: Colors.white54,
                    valueColor:new AlwaysStoppedAnimation<Color>(Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
