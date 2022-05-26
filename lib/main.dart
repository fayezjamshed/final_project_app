import 'package:final_project_app/Screens/app_drawer.dart';
import 'package:final_project_app/Screens/chats_screen.dart';
import 'package:final_project_app/Screens/login_page.dart';
import 'package:final_project_app/Screens/login_police.dart';
import 'package:final_project_app/Screens/map_screen.dart';
import 'package:final_project_app/Screens/police_screen.dart';
import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Screens/select_module.dart';
import 'package:final_project_app/Screens/signup_screen.dart';
import 'package:final_project_app/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/home_screen.dart';
import 'Widget/bottom_nevigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(
              // color: const Color(0xff0000),
              )),
      // initialRoute: MyRoutes.loginroute,
      home: AnimatedSplashScreen(
        splash: SplashScreen(),
        nextScreen: SignUpScreen(),
        duration: 1000,
        backgroundColor: Colors.black,
      ),
      routes: {
        // "/": (context) => LoginScreen(),
        MyRoutes.homeroute: (context) => BottomNevigations(),
        MyRoutes.signuproute: (context) => SignUpScreen(),
        MyRoutes.loginroute: (context) => LoginScreen(),
        MyRoutes.loginpoliceroute: (context) => PoliceLogin(),
        MyRoutes.policeroute: (context) => PoliceScreen()
      },
    );
  }
}
