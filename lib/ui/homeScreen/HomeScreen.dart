import 'package:flutter/material.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/Footer.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/HomeScreenContent.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/NavBar.dart';
import 'package:flutter_web_001/values/Colors.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.appPrimaryColor,
          child: Column(
            children: [
              NavBar(),
              Spacer(flex: 1,),
              HomeScreenContainer(),
              Spacer(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
