import 'package:cu_lost_and_find/config/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formPhoneKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    Color givenBlue = const Color(0xFF314b5c);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppTheme().backgroundColor,
        body: Stack(
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   top: 0,
            //   child: Container(
            //     height: h,
            //     child: Image.asset(
            //       "assets/Icons/BG.png",
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                )),
            Positioned(
                left: 20,
                right: 20,
                top: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Icons/img.png',
                      height: 180,
                      width: 180,
                    ),
                    const Text(
                      'CU Lost & Found',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'cursive'),
                    ),
                    SizedBox(
                      height: .01 * h,
                    ),
                    Container(
                      height: .75 * h,
                      width: w,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Form(
                        key: _formPhoneKey,
                        child: Column(
                          children: [
                            Container(
                              width: w,
                              height: .15 * h,
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: .02 * h, bottom: .02 * h),
                                    width: .85 * w,
                                    height: .08 * h,
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 12.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(.4, .4),
                                          )
                                        ]),
                                    child: TextFormField(
                                      controller: phone,
                                      style:
                                          const TextStyle(fontFamily: 'Luxia'),
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.phone_android_outlined,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          hintText: 'Enter Phone Number',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Luxia Regular',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                      validator: (phoneNo) {
                                        // if (InputValidationMixin.isPhoneValid(
                                        //     phoneNo: phoneNo)) {
                                        //   return null;
                                        // } else {
                                        //   return 'Enter a valid Phone No';
                                        // }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF77216F)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Join(
                                        phNumber: phone.text,
                                        VerificationId: verificationID,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: .39 * w,
                                  height: h * .06,
                                  padding: const EdgeInsets.all(5.0),
                                  child: const Center(
                                    child: Text("SENT OTP",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "OPTICopperplate")),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
