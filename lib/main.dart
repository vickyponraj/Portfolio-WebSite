import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/navigation/navigation_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       builder:() =>MaterialApp(
         themeMode: ThemeMode.light,
         darkTheme: ThemeConst.darkThemeData,
         theme: ThemeConst.darkThemeData,
         title: 'Vignesh Ponraj - Mobile App Developer',
         debugShowCheckedModeBanner: false,
         onGenerateRoute: NavigationRouter.generateRoute,
         initialRoute: NavigationRouter.FIRST_PAGE,
       ),
    );
  }
}
