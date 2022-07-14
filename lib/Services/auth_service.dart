import 'package:final_project_app/Widget/bottom_nevigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationCode;
  Future registerUser(String mobile, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: "+92${mobile}",
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential authCredential) {
          _auth.signInWithCredential(authCredential).then((result) {
            if (result.user != null) {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => BottomNevigations()));
              print("login successfully");
            }
          }).catchError((e) {
            print(e);
          });
        },
        verificationFailed: (authException) {
          print(authException.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationCode = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
        });
  }

  String? get verificationId {
    return verificationCode;
  }
}
