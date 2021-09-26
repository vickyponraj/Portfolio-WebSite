import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vignesh_portfolio_2021/data/model/FooterItemData.dart';
import 'package:vignesh_portfolio_2021/values/AppAssets.dart';
import 'package:vignesh_portfolio_2021/values/AppStrings.dart';
import 'package:vignesh_portfolio_2021/values/Colors.dart';
class Footer extends StatelessWidget {

  final FooterItemData faceBook = new FooterItemData(AppStrings.labelFacebook,AppAssets.facebook,AppStrings.urlFacebook);
  final FooterItemData email = new FooterItemData(AppStrings.labelEmail,AppAssets.email,AppStrings.urlEmail);
  final FooterItemData linkedIn = new FooterItemData(AppStrings.labelLinkedIn,AppAssets.linkedIn,AppStrings.urlLinkedIn);



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