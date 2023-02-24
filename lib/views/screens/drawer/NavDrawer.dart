import 'package:cu_lost_and_find/helpers/shared_services.dart';
import 'package:cu_lost_and_find/utils/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String? imgUrl = "htt";
  String userName = "Username";
  FirebaseAuth auth = FirebaseAuth.instance;
  getImg() async {
    imgUrl = await getImageFromLocal();
    userName = (await getNameFromLocal())!;
  }

  logoutUser(BuildContext context) {
    Navigator.pop(context);
    auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.LoginScreen, (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getImg();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.cyan,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage("https://"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.cyan,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.cyan,
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.cyan,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                logoutUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
