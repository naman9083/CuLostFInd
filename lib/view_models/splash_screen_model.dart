import 'package:flutter/material.dart';

import '../utils/routes/route_names.dart';

class MyCustomClass {
  const MyCustomClass();

  Future<void> myAsyncMethod(
      BuildContext context, VoidCallback onSuccess) async {
    await Future.delayed(const Duration(seconds: 2));
    onSuccess.call();
  }
}

class SplashScreenModel {
  initiateApp(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.categoryLoginScreen, (route) => false);
  }
}
