import 'package:cu_lost_and_find/utils/routes/route_names.dart';
import 'package:cu_lost_and_find/views/screens/authentication/Login.dart';
import 'package:cu_lost_and_find/views/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import '../../views/screens/errorScreens/error_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RouteNames.errorScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorScreen());

      case RouteNames.categoryLoginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login());

      // case RouteNames.homeScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const HomePage());
      //
      // case RouteNames.LoginScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const Login());
      //
      // case RouteNames.teacherLoginScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const TeacherLogin());
      //
      // case RouteNames.parentLoginScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ParentLogin());
      //
      // case RouteNames.gamesScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const Games());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorScreen());
    }
  }
}
