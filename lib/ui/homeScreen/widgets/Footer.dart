import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_001/data/model/FooterItemData.dart';
import 'package:flutter_web_001/values/AppAssets.dart';
import 'package:flutter_web_001/values/Colors.dart';
import 'package:flutter_web_001/values/Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class Footer extends StatelessWidget {

  final FooterItemData faceBook = new FooterItemData(Strings.labelFacebook,AppAssets.facebook,Strings.urlFacebook);
  final FooterItemData email = new FooterItemData(Strings.labelEmail,AppAssets.email,Strings.urlEmail);
  final FooterItemData linkedIn = new FooterItemData(Strings.labelLinkedIn,AppAssets.linkedIn,Strings.urlLinkedIn);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FooterContents(linkedIn),
          FooterContents(faceBook),
          FooterContents(email),
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
    letterSpacing: 1.25,
    color: AppColors.white,
  );

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        _launchURL(data.footerUrl);
      },
      child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                SvgPicture.asset(data.footerIconPath,width: 56,color: AppColors.white,),
                Text(data.footerTitle,style: menuTextStyle,)
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