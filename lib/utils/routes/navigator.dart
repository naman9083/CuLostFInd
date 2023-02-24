import 'package:cu_lost_and_find/views/screens/Navigation/LostFound.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == 'LostFound') {
      child = const LostFound();
    } else if (tabItem == 'SalesPurchase') {
      child = Container(
        color: Colors.white,
      );
    } else if (tabItem == 'MyProfile') {
      child = Container(
        color: Colors.white,
      );
    } else if (tabItem == 'Notifications') {
      child = Container(
        color: Colors.white,
      );
    } else {
      child = const Center(child: Text('Settings'));
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
