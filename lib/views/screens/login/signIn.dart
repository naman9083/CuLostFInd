import 'package:cu_lost_and_find/config/color_palette.dart';
import 'package:cu_lost_and_find/helpers/shared_services.dart';
import 'package:cu_lost_and_find/utils/routes/route_names.dart';
import 'package:cu_lost_and_find/views/screens/home/homepage.dart';
import 'package:cu_lost_and_find/views/screens/login/SignUp.dart';
import 'package:cu_lost_and_find/views/screens/login/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? _passwordVisible;
  final FirebaseAuth auth = FirebaseAuth.instance;
  push(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(user?.photoURL);
      newUserToLocal(url: user?.photoURL, name: user?.displayName);
      if (result != null) {
        Fluttertoast.showToast(
            msg: "Logged In Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        push(context);
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  signInUsingEmail() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
      if (credential != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.LoginScreen, (route) => false);
        Fluttertoast.showToast(
            msg: "Logged In Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        // Fluttertoast.showToast(
        //     msg: "No user found for that email.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        // Fluttertoast.showToast(
        //     msg: "Wrong password provided for that user.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme().backgroundColor,
      body: Stack(
        children: [
          // Positioned(
          //     top: 30,
          //     left: 10,
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.arrow_back,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     )),
          Positioned(
              left: 20,
              right: 20,
              top: 50,
              child: Container(
                height: .9 * h,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Icons/img.png',
                      height: 140,
                      width: 140,
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
                      margin: EdgeInsets.only(top: .02 * h, bottom: .02 * h),
                      width: .80 * w,
                      height: .08 * h,
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                        controller: email,
                        style: const TextStyle(fontFamily: 'Luxia'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(
                                fontFamily: 'Luxia Regular',
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: .02 * h, bottom: .02 * h),
                      width: .80 * w,
                      height: .08 * h,
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                        controller: pass,
                        style: const TextStyle(fontFamily: 'Luxia'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _passwordVisible!,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible!;
                                });
                              },
                            ),
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'Luxia Regular',
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        validator: (phoneNo) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF77216F)),
                        ),
                        onPressed: () {
                          if (email.text.isEmpty || pass.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please fill all fields')));
                          } else {
                            signInUsingEmail();
                          }
                        },
                        child: Container(
                          width: .37 * w,
                          height: h * .06,
                          padding: const EdgeInsets.all(5.0),
                          child: const Center(
                            child: Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "OPTICopperplate")),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .02 * h,
                    ),
                    const Text(
                      "-- OR --",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: .02 * h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUp()));
                          },
                          child: Image.asset(
                            'assets/Icons/Login with no..png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            signup(context);
                          },
                          child: Image.asset(
                            "assets/Icons/Google Login.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: .04 * h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CircleAvatar(
                          radius: 3.0,
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 10,
                          height: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: .02 * h,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don't have account? ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "Sign Up!",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()));
                                  }),
                          ]),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
