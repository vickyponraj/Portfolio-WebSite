import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vignesh_portfolio_2021/core/navigation/navigation_router.dart';
import 'package:vignesh_portfolio_2021/values/AppAssets.dart';
import 'package:vignesh_portfolio_2021/values/AppStrings.dart';
import 'package:vignesh_portfolio_2021/values/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavBar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(20), child: SvgPicture.asset(AppAssets.portfolioLogo,height: 38.h)),
          Row(
            children: [
              MenuItem(AppStrings.labelHome,onClick: (){
                Navigator.of(context).pushNamed(NavigationRouter.SECOND_PAGE);
              },),
              SizedBox(
                width: 20,
              ),
              MenuItem(AppStrings.labelAbout,onClick: (){

              },),
              SizedBox(
                width: 20,
              ),
              MenuItem(AppStrings.labelPortfolio),
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
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Text(AppStrings.appLogoTitle, style: display1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(AppStrings.labelHome),
              SizedBox(
                width: 20,
              ),
              MenuItem(AppStrings.labelAbout),
              SizedBox(
                width: 20,
              ),
              MenuItem(AppStrings.labelPortfolio),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String menuTitle;
  final Function()? onClick;
  MenuItem(this.menuTitle,{this.onClick});

  static TextStyle menuTextStyle = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        menuTitle,
        style: menuTextStyle,
      ),
      onTap: onClick,
    );
  }
}

class AppButton extends StatelessWidget {
  final String menuTitle;

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
