import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../config/color_palette.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/Images/Authentication/student_login.png'))),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Icons/logo.png'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 217, 217, 217),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: const EdgeInsets.only(top: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 217, 217, 217),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 2, left: 65),
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                        hintText: 'Student UID',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 217, 217, 217),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 2, left: 65),
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                        hintText: 'Password',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width * 0.20,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 48, 38, 38),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const AutoSizeText(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
