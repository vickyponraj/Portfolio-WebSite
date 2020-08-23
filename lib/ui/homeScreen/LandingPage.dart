import 'package:flutter/material.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/AboutScreenContent.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/Footer.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/HomeScreenContent.dart';
import 'package:flutter_web_001/ui/homeScreen/widgets/NavBar.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  ScrollController _controller;
  double _offset = 0;

  static TextStyle menuTextStyle = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: AppColors.white,
  );

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(_controller),
      endDrawer: Drawer(
        child: SafeArea(
          child: Container(
            color: AppColors.appBarBG,
            child: ListView(
              children: [
                ListTile(
                  trailing: Icon(Icons.close,color: AppColors.appAccentColor,),
                  onTap : () => Navigator.of(context).pop(),
                ),
                SizedBox(),
                ListTile(
                  leading: Icon(Icons.home,color: AppColors.appAccentColor,),
                  onTap : () {
                    _controller.animateTo(0,
                        curve: Curves.easeIn, duration: Duration (milliseconds: 500));
                    Navigator.of(context).pop();
                  },
                  title: Text(Strings.labelHome,style: menuTextStyle,),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline,color: AppColors.appAccentColor,),
                  onTap : () {
                    _controller.animateTo((MediaQuery.of(context).size.height - 72)  * 1,
                        curve: Curves.easeIn, duration: Duration (milliseconds: 500));
                    Navigator.of(context).pop();
                  },
                  title: Text(Strings.labelAbout,style: menuTextStyle,),
                ),
                ListTile(
                  leading: Icon(Icons.verified_user,color: AppColors.appAccentColor,),
                  onTap : () {
                    _controller.animateTo((MediaQuery.of(context).size.height - 72) * 2 ,
                        curve: Curves.easeIn, duration: Duration (milliseconds: 500));
                    Navigator.of(context).pop();
                  },
                  title: Text(Strings.labelPortfolio,style: menuTextStyle,),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 72,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: [
                    Spacer(flex: 1,),
                    HomeScreenContainer(),
                    Spacer(flex: 2,),
                    Footer(),
                    Spacer(flex: 1,)
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 72,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                    children: [
                      AboutScreenContent()
                    ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 72,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 72,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}