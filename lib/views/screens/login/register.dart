import 'package:cu_lost_and_find/config/color_palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? _passwordVisible;
  String? dropdownvalue;
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController rePass = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  bool? _passwordVisible2;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _passwordVisible2 = true;
  }

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: pass.text);
      Navigator.of(context).pop();
      // Fluttertoast.showToast(
      //     msg: "Registered Successfully",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // Fluttertoast.showToast(
        //     msg: "The account already exists for that email.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme().backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 0,
          //   child: SizedBox(
          //     height: h,
          //     child: Image.asset(
          //       "assets/Icons/BG.png",
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Positioned(
              top: 40,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: w * .12,
                  ),
                  const Text(
                    "CREATE YOUR ACCOUNT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
          Positioned(
              left: 15,
              right: 15,
              top: 100,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(.4, .4),
                      )
                    ]),
                height: .73 * h,
                width: .90 * w,
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "      Your Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Container(
                      height: .04 * h,
                      margin: const EdgeInsets.only(left: 11.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ), // margin: EdgeInsets.only(top: .005*h),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: name,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: ("Enter Your Name"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .030 * h,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "      Mobile Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Container(
                      height: .04 * h,
                      margin: const EdgeInsets.only(left: 11.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ),
                      // margin: EdgeInsets.only(top: .005*h),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: mobile,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            hintText: ("Enter Your Mobile"),
                            icon: Image.asset(
                              "assets/Icons/ninty1.png",
                              height: 35,
                              width: 35,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: .030 * h,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "      Email Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Container(
                      height: .04 * h,
                      margin: const EdgeInsets.only(left: 11.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ), // margin: EdgeInsets.only(top: .005*h),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: ("Enter Your Login Email Address"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .030 * h,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "      Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 11.0),
                      height: .04 * h,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ), // margin: EdgeInsets.only(top: .005*h),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: pass,
                        obscureText: _passwordVisible2!,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: ("Enter Password"),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible2!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible2 = !_passwordVisible2!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .030 * h,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "      Re-Enter Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Container(
                      height: .04 * h,
                      margin: const EdgeInsets.only(left: 11.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ), // margin: EdgeInsets.only(top: .005*h),
                      child: TextField(
                        controller: rePass,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _passwordVisible!,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: 'Re-Enter Password',
                          // Here is key idea
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .030 * h,
                    ),
                    // const Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "      Enter City",
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w700),
                    //   ),
                    // ),
                    // Container(
                    //   height: .04 * h,
                    //   margin: const EdgeInsets.only(left: 11.0),
                    //   decoration: const BoxDecoration(
                    //     border: Border(
                    //       bottom: BorderSide(width: 2.0, color: Colors.black),
                    //     ),
                    //   ),
                    //   // margin: EdgeInsets.only(top: .005*h),
                    //   child: Container(
                    //     height: .04 * h,
                    //     width: w,
                    //     decoration: const BoxDecoration(
                    //       border: Border(
                    //         bottom: BorderSide(width: .2, color: Colors.black),
                    //       ),
                    //     ),
                    //     child: DropdownButtonHideUnderline(
                    //       child: DropdownButton<String>(
                    //         value: dropdownvalue,
                    //         // Down Arrow Icon
                    //         icon: const Icon(
                    //           Icons.keyboard_arrow_down,
                    //           color: Colors.black87,
                    //         ),
                    //         hint: const Text("   Enter Your City"),
                    //         // Array list of items
                    //         items: items.map((String items) {
                    //           return DropdownMenuItem(
                    //             value: items,
                    //             child: Text(items),
                    //           );
                    //         }).toList(),
                    //         // After selecting the desired option,it will
                    //         // change button value to selected value
                    //         onChanged: (newValue) {
                    //           setState(() {
                    //             dropdownvalue = newValue!;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: .015 * h,
                    // ),
                    Container(
                      margin: const EdgeInsets.only(left: 11.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "    By signing up, you agree to Ease it App's",
                              style: TextStyle(
                                color: Color(0xff9f92a1ff),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "  Terms and Conditions",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 30,
            right: 100,
            left: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF77216F)),
                ),
                onPressed: () {
                  signIn();
                },
                child: Container(
                  width: .37 * w,
                  height: h * .06,
                  padding: const EdgeInsets.all(5.0),
                  child: const Center(
                    child: Text("REGISTER",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OPTICopperplate")),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
