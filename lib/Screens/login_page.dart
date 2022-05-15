import 'dart:convert';
import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:final_project_app/httpservice.dart';
// import 'package:final_project_app/httpservice.dart';s
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(child: LoginInput()),
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
    );
  }
}

class LoginInput extends StatefulWidget {
  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final username = TextEditingController();
  final password = TextEditingController();
  HttpService? https;

  Future logincall() async {
    await https!.loginRequest(username.text, password.text);
  }

  @override
  void initState() {
    https = HttpService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/panic-logo.png",
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          TextField(
                  controller: username,
                  decoration:
                      textfielddecoration("Enter User Name", "User Name"))
              .py(15),
          TextField(
            controller: password,
            decoration: textfielddecoration("Enter Password", "Password"),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {
              // logincall();
              Navigator.pushNamed(context, MyRoutes.homeroute);
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
                // border: Border.all(width: 5, color: Colors.black)
              ),
              child: "LOGIN".text.xl3.white.make().p(5),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.signuproute);
            },
            child: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                  )),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                  // border:
                  // Border(bottom: BorderSide(width: 10, color: Colors.red))
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.red,
                  //     offset: Offset(0.0, 10.0), //(x,y)
                  //     blurRadius: 5.0,
                  //   ),
                  // ],
                ),
                child: "SIGN UP".text.xl3.white.make().p(5),
              ),
            ]),
          ),
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Text(
          //           "LogIn as a?",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         InkWell(
          //           onTap: () {},
          //           child: const Text(
          //             "Saviour",
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20,
          //                 decoration: TextDecoration.underline,
          //                 decorationColor: Colors.black),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ).p(30),
    );
  }
}
