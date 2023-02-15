// import 'package:flutter/material.dart';
// import 'package:unoquide/constants/constants.dart';
// import 'package:unoquide/utils/common/commonItems.dart';
// import 'package:unoquide/views/screens/NavbarItems/Connect/connect.dart';
// import 'package:unoquide/views/screens/NavbarItems/EmotionalIntelligence/EmotionalIntelligence.dart';
// import 'package:unoquide/views/screens/NavbarItems/Games/games.dart';
// import 'package:unoquide/views/screens/NavbarItems/Home/home.dart';
// import 'package:unoquide/views/screens/NavbarItems/Profile/myProfile.dart';
// import 'package:unoquide/views/screens/NavbarItems/Subject/subjectCourses.dart';
//
// import '../../../utils/routes/navigator.dart';
// import '../NavbarItems/AudioVideo/AudioVideo.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Widget> pages = [
//     const EmotionalIntelligence(),
//     const Home(),
//     SubjectCourses(
//       screenIndex: 0,
//     ),
//     const Games(),
//     const AudioVideo(),
//     const Connect(),
//     const MyProfile(),
//   ];
//   int _selectedIndex = 1;
//   String currentPage = 'Home';
//   List<String> pageKeys = [
//     'EQ',
//     'Home',
//     'SubjectCourses',
//     'Games',
//     'AudioVideo',
//     'StatisticsReports',
//     'MyProfile',
//   ];
//   Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
//     'EQ': GlobalKey<NavigatorState>(),
//     'Home': GlobalKey<NavigatorState>(),
//     'SubjectCourses': GlobalKey<NavigatorState>(),
//     'Games': GlobalKey<NavigatorState>(),
//     'AudioVideo': GlobalKey<NavigatorState>(),
//     'StatisticsReports': GlobalKey<NavigatorState>(),
//     'MyProfile': GlobalKey<NavigatorState>(),
//   };
//   void selectTab(int index) {
//     if (index == _selectedIndex) {
//       navigatorKeys[pageKeys[index]]!
//           .currentState!
//           .popUntil((route) => route.isFirst);
//     } else {
//       setState(() {
//         _selectedIndex = index;
//         currentPage = pageKeys[index];
//       });
//     }
//   }
//
//   Future<bool> _onWillPop() async {
//     final isFirstRouteInCurrentTab =
//         !await navigatorKeys[currentPage]!.currentState!.maybePop();
//     if (isFirstRouteInCurrentTab) {
//       if (currentPage != 'Home') {
//         selectTab(1);
//         return false;
//       }
//     }
//     return isFirstRouteInCurrentTab;
//   }
//
//   final Widget _currentBody = const Home();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return _onWillPop();
//       },
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: Row(
//           children: <Widget>[
//             Column(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .14,
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           selectTab(1);
//                         },
//                         child: Image.asset(
//                           'assets/Icons/sym.png',
//                           height: 50,
//                           width: 50,
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             _onWillPop();
//                           },
//                           icon: Image.asset(
//                             'assets/Icons/Undo.png',
//                             height: 50,
//                             width: 50,
//                           )),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * .85,
//                   width: MediaQuery.of(context).size.width * .11,
//                   margin: const EdgeInsets.only(left: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: ListView(
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(0);
//                           print('EQ');
//                         },
//                         child: const RailIconImage(
//                             label: 'Emotional\nIntelligence',
//                             imgUrl: 'assets/Icons/brain.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(1);
//                         },
//                         child: const RailIconImage(
//                             label: 'Home',
//                             imgUrl: 'assets/Icons/home.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(2);
//                         },
//                         child: const RailIconImage(
//                             label: 'Syllabus/Courses',
//                             imgUrl: 'assets/Icons/book.png',
//                             size: 25),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(3);
//                         },
//                         child: const RailIconImage(
//                             label: 'Games/\nInteractive Courses',
//                             imgUrl: 'assets/Icons/games.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(4);
//                         },
//                         child: const RailIconImage(
//                             label: 'Audio Visual\nContent',
//                             imgUrl: 'assets/Icons/video.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(5);
//                         },
//                         child: const RailIconImage(
//                             label: 'Connect',
//                             imgUrl: 'assets/Icons/exam.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: const RailIconImage(
//                             label: 'Calender',
//                             imgUrl: 'assets/Icons/calender.png',
//                             size: 25),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           selectTab(6);
//                         },
//                         child: const RailIconImage(
//                             label: 'My Profile',
//                             imgUrl: 'assets/Icons/profile.png',
//                             size: 30),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//                 child: Stack(
//               children: <Widget>[
//                 _buildOffstageNavigator('EQ'),
//                 _buildOffstageNavigator('Home'),
//                 _buildOffstageNavigator('SubjectCourses'),
//                 _buildOffstageNavigator('Games'),
//                 _buildOffstageNavigator('AudioVideo'),
//                 _buildOffstageNavigator('StatisticsReports'),
//                 _buildOffstageNavigator('MyProfile'),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOffstageNavigator(String navigatorKey) {
//     return Offstage(
//       offstage: currentPage != navigatorKey,
//       child: TabNavigator(
//         navigatorKey: navigatorKeys[navigatorKey]!,
//         tabItem: navigatorKey,
//       ),
//     );
//   }
// }
