import 'package:flutter/material.dart';

import 'widgets/Footer.dart';
import 'widgets/HomeScreenContent.dart';
import 'widgets/NavBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
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
