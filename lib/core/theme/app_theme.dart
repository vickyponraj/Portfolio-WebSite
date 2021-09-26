import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool _lightTheme = false;

class ThemeConst {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;
  
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  
  static ThemeData lightThemeData = getThemeData(_lightColorScheme, _lightFocusColor, isLightTheme: true);
  static ThemeData darkThemeData = getThemeData(_darkScheme, _darkFocusColor, isLightTheme: false);

  // static ThemeData darkThemeData=getThemeData(_darkColorScheme,_darkFocusColor, isLightTheme: false);
  
  static ThemeData getThemeData(ColorScheme colorScheme, Color focusColor,
      {bool isLightTheme = true}) {
    _lightTheme = isLightTheme; // to get the light colors from extension
    return ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      textTheme: _textThemeLight(colorScheme),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        titleTextStyle: _textThemeLight(colorScheme).apply(bodyColor: colorScheme.onPrimary).headline6,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: colorScheme.brightness),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      // accentColor: colorScheme.primary,
      focusColor: focusColor,
      backgroundColor: colorScheme.background,
      buttonTheme: ButtonThemeData(
        minWidth: 50,
      ),
      // buttonColor: colorScheme.primary,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
        Color.alphaBlend(_lightFillColor.withOpacity(0.80), _darkFillColor),
      ),
    );
  }
  
  // SiplyColors _lightSiplyColors = SiplyColors(
  //   colorScheme: _lightColorScheme,
  //   primaryColorLight: Color(0xFFd1bff3),
  //   darkGray: Color(0xFF979797),
  //   grey: Color(0xFFACACAC),
  //   white: Color(0xFFFFFFFF),
  //   red: Color(0xFFDB3022),
  //   lightGray: Color(0xFF9B9B9B),
  //   orange: Color(0xFFFFBA49),
  //   backgroundLight: Color(0xFFF9F9F9),
  //   black: Color(0x00000000),
  //   successGreen: Color(0xFF53CC73),
  //   disable: Color(0xFF929794),
  //   primaryTextColor: Color(0xFF000000),
  //   primaryTextColorLight: Color(0xFF464646),
  // );
  
  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF35C1C8),

    // changed to new theme
    primaryVariant: Color(0xFFBFFBFF),
    // changed to new theme
    secondary: Color(0xFF361171),
    // changed to new theme
    secondaryVariant: Color(0xFF53cc73),
    // changed to new theme
    background: Colors.white,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _darkFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,

  );

  static const ColorScheme _darkScheme = ColorScheme(
    primary: Color(0xFF6027d0),
    // changed to new theme
    primaryVariant: Color(0xFFc526fc),
    // changed to new theme
    secondary: Color(0xFFfa6400),
    // changed to new theme
    secondaryVariant: Color(0xFF53cc73),
    // changed to new theme
    background: Colors.black,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _darkFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600; // not used
  static const _bold = FontWeight.w700;
  
  static TextTheme _textThemeLight(ColorScheme colorScheme) {
    return TextTheme(
      headline1: GoogleFonts.inter(
          fontWeight: _bold, fontSize: 30.sp, color: colorScheme.white),
      headline2: GoogleFonts.inter(
          fontWeight: _medium, fontSize: 16.sp, color: colorScheme.white),
      headline3: GoogleFonts.inter(
          fontWeight: _bold,
          fontSize: 20.sp,
          color: colorScheme.primaryTextColor),
      headline4: GoogleFonts.inter(
          fontWeight: _medium, fontSize: 24.sp, color: colorScheme.white),
      headline5: GoogleFonts.inter(
          fontWeight: _bold, fontSize: 18.sp, color: colorScheme.white),
      headline6: GoogleFonts.inter(
          fontWeight: _regular, fontSize: 12.sp, color: colorScheme.white),
      button: GoogleFonts.inter(
          fontWeight: _bold, fontSize: 16.sp, color: colorScheme.white),
      subtitle1: GoogleFonts.inter(
          fontWeight: _bold,
          fontSize: 24.sp,
          color: colorScheme.primaryTextColor),
      subtitle2: GoogleFonts.inter(
          fontWeight: _medium, fontSize: 14.sp, color: colorScheme.grey),
      bodyText1: GoogleFonts.inter(
          fontWeight: _medium,
          fontSize: 16.sp,
          color: colorScheme.primaryColor),
      bodyText2: GoogleFonts.inter(
          fontWeight: _medium,
          fontSize: 10.sp,
          color: colorScheme.primaryTextColorLight),
      caption: GoogleFonts.inter(
          fontWeight: _bold,
          fontSize: 14.sp,
          color: colorScheme.primaryTextColor),
      overline: GoogleFonts.inter(
          fontWeight: _medium, fontSize: 12.sp, color: colorScheme.grey),
    );
  }
}

extension colorExtends on ColorScheme {
  static const primaryColorl = Color(0xFF6027d0);
  static const primaryColorLightl = Color(0xFFd1bff3);
  static const darkGrayl = Color(0xFF979797);
  static const greyl = Color(0xFFACACAC);
  static const whitel = Color(0xFFFFFFFF);
  static const redl = Color(0xFFDB3022);
  static const lightGrayl = Color(0xFF9B9B9B);
  static const orangel = Color(0xFFfff5e0);
  static const backgroundLightl = Color(0xFFF9F9F9);
  static const blackl = Color(0xff000000);
  static const popUpBannerGreenl = Color(0xFF19a96a);
  static const popUpBannerRedl = Color(0xFFA12027);
  static const popUpBannerOrangel = Color(0xFFFA6400);
  static const disablel = Color(0xFF929794);
  static const primaryTextColorl = Color(0xFF000000);
  static const primaryTextColorLightl = Color(0xFF464646);
  static const yellowl = Color(0xfffdd856);
  static const lightyellowl = Color(0xffffcf66);
  static const sapphirel = Color(0xff0091ff);
  static const electic_purpll = Color(0xffc526fc);
  static const shadowColorl = Color(0x29747474);
  static const _lightRedColor = Color(0xFFFFF2F2);
  static const _maroonColor = Color(0xFFC76060);
  static const primaryColorD = Color(0xFF6027d0);
  static const primaryColorLightD = Color(0xFFd1bff3);
  static const darkGrayD = Color(0xFF979797);
  static const greyD = Color(0xFFACACAC);
  static const whiteD = Color(0x00FFFFFF);
  static const redD = Color(0xFFDB3022);
  static const lightGrayD = Color(0xFF9B9B9B);
  static const orangeD = Color(0xFFFFBA49);
  static const backgroundLightD = Color(0xFFF9F9F9);
  static const blackD = Color(0x00000000);
  static const popUpBannerGreenD = Color(0xFF53CC73);
  static const popUpBannerRedD = Color(0xFFA12027);
  static const popUpBannerOrangeD = Color(0xFFFA6400);
  static const disableD = Color(0xFF929794);
  static const primaryTextColorD = Color(0xFF000000);
  static const primaryTextColorLightD = Color(0xFF464646);
  static const yellowD = Color(0xfffdd856);
  static const lightyellowD = Color(0xffffcf66);
  static const sapphireD = Color(0xff0091ff);
  static const electic_purpleD = Color(0xffc526fc);
  static const shadowColorD = Color(0x29747474);
  static const yellowColor = Color(0xFFFFCF66);
  static const _secondaryCardColor = Color(0xFF6F77FB);
  static const _purple = Color(0xFF8052d9);
  static const _purple4 = Color(0xFFF9F7Fd);
  static const _indigo = Color(0xFF1A3dA3);
  static const _lightBlack = Color(0xFFF1F4FF);
  static const _lightGreen = Color(0xFFEFFFFA);
  static const _darkGreen = Color(0xFF258C6E);
  static const _lightIndigo = Color(0xffdddfff);
  static const _indigoDark = Color(0xff454dc5);
  static const _lightblue = Color(0xfff9faff);
  static const lightTextColorL = Color(0xFF747474);
  static const lightTextColorD = Color(0xFF747474);
  
  static const _bottomSheetShadow = Color(0x29000000);
  static const _lightGreenCardColor=Color(0xFFe5fbf7);
  
  Color get lightGreenCardColor=>_lightGreenCardColor;
  
  Color get secondaryCardColor => _secondaryCardColor;
  
  Color get primaryColor => _lightTheme ? primaryColorl : primaryColorD;
  
  Color get primaryColorLight =>
      _lightTheme ? primaryColorLightl : primaryColorLightD;
  
  Color get darkGray => _lightTheme ? darkGrayl : darkGrayD;
  
  Color get grey => _lightTheme ? greyl : greyD;
  
  Color get white => _lightTheme ? whitel : whiteD;
  
  Color get red => _lightTheme ? redl : redD;
  
  Color get lightGray => _lightTheme ? lightGrayl : lightGrayD;
  
  Color get orange => _lightTheme ? orangel : orangeD;
  
  Color get purple => _purple;
  
  Color get backgroundLight =>
      _lightTheme ? backgroundLightl : backgroundLightD;
  
  Color get lightRedColor => _lightRedColor;
  
  Color get black => _lightTheme ? blackl : blackD;
  
  Color get popUpBannerGreen =>
      _lightTheme ? popUpBannerGreenl : popUpBannerGreenD;
  
  Color get popUpBannerRed => _lightTheme ? popUpBannerRedl : popUpBannerRedD;
  
  Color get popUpBannerOrange =>
      _lightTheme ? popUpBannerOrangel : popUpBannerOrangeD;
  
  Color get disable => _lightTheme ? disablel : disableD;
  
  Color get primaryTextColor =>
      _lightTheme ? primaryTextColorl : primaryTextColorD;
  
  Color get primaryTextColorLight =>
      _lightTheme ? primaryTextColorLightl : primaryTextColorLightD;
  
  Color get yellow => _lightTheme ? yellowl : yellowD;
  
  Color get lightyellow => _lightTheme ? lightyellowl : lightyellowD;
  
  Color get sapphire => _lightTheme ? sapphirel : sapphireD;
  
  Color get electic_purpl => _lightTheme ? electic_purpll : electic_purpleD;
  
  Color get shadowColor => _lightTheme ? shadowColorl : shadowColorD;
  
  Color get yellowCardColor => yellowColor;
  
  Color get maroonColor => _maroonColor;
  
  Color get purple4 => _purple4;
  
  Color get indigo => _indigo;
  
  Color get lightBlack => _lightBlack;
  
  Color get lightGreen => _lightGreen;
  
  Color get darkGreen => _darkGreen;
  
  Color get indigoDark => _indigoDark;
  
  Color get lightIndigo => _lightIndigo;
  
  Color get lightTextColor => _lightTheme? lightTextColorL : lightTextColorD;
  
  Color get bottomSheetShadow => _bottomSheetShadow;

  Color get lightblue => _lightblue;
}