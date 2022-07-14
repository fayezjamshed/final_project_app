import 'package:final_project_app/Screens/home_screen.dart';
import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Services/auth_service.dart';
import 'package:final_project_app/Widget/bottom_nevigation.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatefulWidget {
  String? phone_no;

  OtpScreen({Key? key, required this.phone_no});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthService _authService = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationCode;
  TextEditingController otpController = TextEditingController();

  Future registerUser() async {
    _auth.verifyPhoneNumber(
        phoneNumber: "+92${widget.phone_no}",
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
          setState(() {
            verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        });
  }

  @override
  void initState() {
    registerUser();
    _authService.registerUser("${widget.phone_no}", context);
    // verifiCationId = _authService.verificationId;

    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Verification Code Send to".text.xl2.bold.make().p(10),
            "+92 ${widget.phone_no}".text.xl.make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                      controller: otpController,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(
                          filled: true,
                          counterText: "",
                          fillColor: Colors.grey.shade200,
                          hintText: "------")),
                ).p(10),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, MyRoutes.homeroute);

                      FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: "${verificationCode}",
                              smsCode: otpController.text))
                          .then((value) async {
                        if (value != null) {
                          Navigator.pushNamed(context, MyRoutes.homeroute);
                        }
                      });
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child:
                            Center(child: "SUBMIT".text.xl.bold.white.make())))
                .p(20)
          ],
        ),
      ),
    );
  }
}
