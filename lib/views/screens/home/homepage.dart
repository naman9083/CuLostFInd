import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';

import 'package:cu_lost_and_find/utils/routes/navigator.dart';
import 'package:cu_lost_and_find/views/screens/drawer/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 0;

  List<TabData> tabItems() {
    return [
      TabData(
        icon: Icons.question_mark_sharp,
        iconSize: 30,
        title: "Lost & Found",
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.shopping_bag,
        iconSize: 30,
        title: "Sale/Buy",
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.person,
        title: "My Profile",
        iconSize: 30,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.notifications,
        title: "Notifications",
        iconSize: 30,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  String currentPage = 'LostFound';
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  List<String> pageKeys = [
    'LostFound',
    'SalesPurchase',
    'MyProfile',
    'Notifications',
  ];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    'LostFound': GlobalKey<NavigatorState>(),
    'SalesPurchase': GlobalKey<NavigatorState>(),
    'MyProfile': GlobalKey<NavigatorState>(),
    'Notifications': GlobalKey<NavigatorState>(),
  };
  void selectTab(int index) {
    if (index == _selectedIndex) {
      navigatorKeys[pageKeys[index]]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
        currentPage = pageKeys[index];
      });
    }
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentPage]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentPage != 'Home') {
        selectTab(1);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  final _kTabPages = <Widget>[
    const Center(
        child: Icon(Icons.question_mark, size: 64.0, color: Colors.teal)),
    const Center(
        child: Icon(Icons.shopping_bag, size: 64.0, color: Colors.cyan)),
    const Center(
        child: Icon(Icons.person, size: 64.0, color: Colors.cyanAccent)),
  ];
  final _kTabs = <Tab>[
    const Tab(icon: Icon(Icons.question_mark), text: 'Lost & Found'),
    const Tab(icon: Icon(Icons.shopping_bag), text: 'Sale/Purchase'),
  ];
  final _appBarString = <String>[
    'Lost & Found',
    'Sale/Buy',
    'My Profile',
    'Notifications'
  ];

  // final Widget _currentBody = const Home();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 70;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }
    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldState.currentState!.openDrawer();
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 20.0),
          title: Text(
            _appBarString[_selectedIndex],
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: CircleBottomNavigationBar(
          tabs: tabItems(),
          initialSelection: selectedPos,

          onTabChangedListener: (position) {
            selectTab(position);
          },
          barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
          arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : 70.0,
          itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
          itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
          circleOutline: 0,
          arcWidth: 0,
          circleSize: 60.0,
          blurShadowRadius: 50.0,
          circleColor: Colors.cyanAccent,
          activeIconColor: Colors.white,
          inactiveIconColor: Colors.grey,
          // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
          barBackgroundColor: Colors.white,
          // back
          // barBackgroundGradient: LinearGradient(
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          //   colors: [
          //     Colors.blue,
          //     Colors.red,
          //   ],
          // ),
        ),
        drawer: const NavDrawer(),
        body: Row(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                _buildOffstageNavigator('LostFound'),
                _buildOffstageNavigator('SalesPurchase'),
                _buildOffstageNavigator('MyProfile'),
                _buildOffstageNavigator('Notifications'),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String navigatorKey) {
    return Offstage(
      offstage: currentPage != navigatorKey,
      child: TabNavigator(
        navigatorKey: navigatorKeys[navigatorKey]!,
        tabItem: navigatorKey,
      ),
    );
  }
}
