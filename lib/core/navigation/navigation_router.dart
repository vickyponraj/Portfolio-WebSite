

import 'package:flutter/material.dart';
import 'package:vignesh_portfolio_2021/ui/homeScreen/HomeScreen.dart';
import 'package:vignesh_portfolio_2021/ui/secondScreen/second_screen.dart';

class NavigationRouter {

  static const String FIRST_PAGE = '/first_page';
  static const String SECOND_PAGE = '/second_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRouter.FIRST_PAGE:
        return _GeneratePageRoute(widget: HomeScreen(), routeName: settings.name);
        case NavigationRouter.SECOND_PAGE:
        return _GeneratePageRoute(widget: SecondScreen(), routeName: settings.name);
      default:
        return _GeneratePageRoute(widget: HomeScreen(), routeName: settings.name);
    }
  }

}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;
  _GeneratePageRoute({this.widget, this.routeName})
      : super(
      settings: RouteSettings(name: routeName),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget??SizedBox();
      },
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return SlideTransition(
          textDirection: TextDirection.ltr,
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}
