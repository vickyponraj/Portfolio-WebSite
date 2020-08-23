import 'package:flutter/material.dart';
import 'package:flutter_web_001/values/AppAssets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 72.0;
  final double _preferredHeightMobile = 56.0;
  final ScrollController controller;
  bool isMobile = false;

  NavBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavBar(controller);
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavBar(controller);
        } else {
          return MobileNavBar();
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

class DesktopNavBar extends StatelessWidget {
  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  final ScrollController controller;

  DesktopNavBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarBG,
      constraints: BoxConstraints(maxHeight: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(10), child: Text(Strings.appLogoTitle, style: display1)),
          Row(
            children: [
              InkWell(
                  onTap: (){
                    controller.animateTo(0,
                        curve: Curves.easeIn, duration: Duration (milliseconds: 500));
                  },
                  child: MenuItem(Strings.labelHome)),
              SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: (){
                    controller.animateTo((MediaQuery.of(context).size.height - 72)  * 1,
                        curve: Curves.easeIn, duration: Duration (milliseconds: 500));
                  },
                  child: MenuItem(Strings.labelAbout)),
              SizedBox(
                width: 20,
              ),
              InkWell(onTap: (){
                controller.animateTo((MediaQuery.of(context).size.height - 72) * 2,
                    curve: Curves.easeIn, duration: Duration (milliseconds: 500));
              },child: MenuItem(Strings.labelPortfolio)),
              SizedBox(
                width: 20,
              ),
              /* AppButton(Strings.labelContact),
              SizedBox(
                width: 20,
              ),*/
            ],
          )
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarBG,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(10), child: Text(Strings.appLogoTitle, style: display1)),
          InkWell(
            onTap: (){
              Scaffold.of(context).openEndDrawer();
            },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Image.asset(
            AppAssets.menu,
            height: 24,
            width: 24,
            color: AppColors.white,
          )))
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String menuTitle;

  MenuItem(this.menuTitle);

  static TextStyle menuTextStyle = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      menuTitle,
      style: menuTextStyle,
    );
  }
}

class AppButton extends StatelessWidget {
  String menuTitle;

  AppButton(this.menuTitle);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        onPressed: () {},
        child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Text(
              menuTitle,
              style: TextStyle(
                color: AppColors.appPrimaryColor,
                fontSize: 16,
                fontFamily: GoogleFonts.carterOne().fontFamily,
              ),
            )));
  }
}
