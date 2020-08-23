import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreenContent extends StatelessWidget {
  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.pollerOne().fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontSize: 12,
    color: AppColors.textColorSecondary,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                Strings.labelWorks,
                style: display1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
              child: Text(
                Strings.labelMyWorks,
                style: displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
