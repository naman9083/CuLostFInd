// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// void loginWithPhone(TextEditingController phone, BuildContext context) async {
//   auth.verifyPhoneNumber(
//     phoneNumber: "+91${phone.text}",
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       await auth.signInWithCredential(credential).then((value) {
//         print("You are logged in successfully");
//       });
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       print(e.message);
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       verificationID = verificationId;
//       print(verificationId);
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Verify(
//             phNumber: phNumber,
//             VerificationId: verificationID,
//           ),
//         ),
//       );
//       setState(() {
//         verificationID = verificationId;
//       });
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {},
//   );
// }
