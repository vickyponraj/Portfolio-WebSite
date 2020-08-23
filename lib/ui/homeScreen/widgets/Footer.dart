import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_001/data/model/FooterItemData.dart';
import 'package:flutter_web_001/values/AppAssets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final FooterItemData anubavam =
      new FooterItemData(Strings.labelAnubavam, AppAssets.anubavamLogo, Strings.urlAnubavam);
  final FooterItemData optisol =
      new FooterItemData(Strings.labelOptisol, AppAssets.optisolLogo, Strings.urlOptisol);
  final FooterItemData mithrAi =
      new FooterItemData(Strings.labelMithrAi, AppAssets.mithrAiLogo, Strings.urlMithrAi);

  static TextStyle display1 = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(Strings.labelFewPlacesIHaveWorked,style: display1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  _launchURL(anubavam.footerUrl);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    anubavam.footerIconPath,
                    color: AppColors.white,
                    height: 100,
                      width: 100
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  _launchURL(optisol.footerUrl);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    optisol.footerIconPath,
                    color: AppColors.white,
                    height: 100,
                      width: 100
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  _launchURL(mithrAi.footerUrl);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    mithrAi.footerIconPath,
                    color: AppColors.white,
                    height: 50,
                    width: 70
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterContents extends StatelessWidget {
  final FooterItemData data;

  const FooterContents(this.data);

  static TextStyle menuTextStyle = TextStyle(
    fontFamily: GoogleFonts.carterOne().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchURL(data.footerUrl);
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//                SvgPicture.asset(data.footerIconPath,width: 56,color: AppColors.white,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  data.footerIconPath,
                  color: AppColors.white,
                  height: 50,
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
