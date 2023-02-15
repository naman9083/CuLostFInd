// import 'package:flutter/material.dart';
//
//
//
//
// class TabNavigator extends StatelessWidget {
//   const TabNavigator(
//       {Key? key, required this.navigatorKey, required this.tabItem})
//       : super(key: key);
//   final GlobalKey<NavigatorState> navigatorKey;
//   final String tabItem;
//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//     if (tabItem == 'EQ') {
//       child = const EmotionalIntelligence();
//     } else if (tabItem == 'Home') {
//       child = const Home();
//     } else if (tabItem == 'SubjectCourses') {
//       child = SubjectCourses(
//         screenIndex: 0,
//       );
//     } else if (tabItem == 'AudioVideo') {
//       child = const AudioVideo();
//     } else if (tabItem == 'StatisticsReports') {
//       child = const Connect();
//     } else if (tabItem == 'MyProfile') {
//       child = const MyProfile();
//     } else if (tabItem == 'Games') {
//       child = const Games();
//     } else {
//       child = const Center(child: Text('Settings'));
//     }
//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) => child,
//         );
//       },
//     );
//   }
// }
