import 'package:chatwithfirebase/utilities/routes.dart';
import 'package:chatwithfirebase/view/pages/bottom_navigation_bar.dart';
import 'package:chatwithfirebase/view/pages/landing_page.dart';
import 'package:chatwithfirebase/view/pages/auth_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => AuthPage(),
        settings: routeSettings,
      );
      case AppRoutes.bottomBarPageRoute:
      return CupertinoPageRoute(
        builder: (_) => BottomBarPage(),
        settings: routeSettings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => LandingPage(),
        settings: routeSettings,
      );
  }
}
