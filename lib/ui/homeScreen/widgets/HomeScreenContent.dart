
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_001/values/AppAssets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenContainer extends StatelessWidget {


  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: GoogleFonts.breeSerif().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textColorSecondary,
  );

  List<Widget> pageContents(maxWidth) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.appTitle,
                style: display1,
              ),
              Text(
                Strings.labelProfileDesc,
                style: displaySmall,
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 50,width: 50,),
      ClipRRect(
          borderRadius: BorderRadius.circular(maxWidth/2),
          child: Image.asset(AppAssets.profilePic, width: maxWidth / 2))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: LayoutBuilder(
        builder: (context, container) {
          if (container.maxWidth > 800) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pageContents(container.biggest.width / 2),
            );
          } else {
            return Column(
              children: pageContents(container.biggest.width),
            );
          }
        },
      ),
    );
  }
}
