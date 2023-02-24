import 'package:cu_lost_and_find/config/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_models/splash_screen_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenModel splashViewModel = SplashScreenModel();

  @override
  void initState() {
    super.initState();
    splashViewModel.initiateApp(context);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppTheme().backgroundColor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/Icons/img.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Worry Free',
                  style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'cursive',
                    fontFamily: GoogleFonts.julee().fontFamily,

                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                        blurRadius: 5.0,
                        color: Colors.red,
                        offset: Offset(2.50, 2.50),
                      ),
                    ],
                    fontSize: 35,
                  ),
                ),
              ),
              // SizedBox(
              //   height: h * 0.15,
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              //   child: Text(
              //     'An Application for CU Students to find their lost items or Buy/Sell their items',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontFamily: GoogleFonts.julee().fontFamily,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 200,
              // ),
            ]));
  }
}
