import 'package:final_project_app/Screens/routes.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PoliceLogin extends StatelessWidget {
  const PoliceLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PoliceLoginField(),
      ),
    );
  }
}

class PoliceLoginField extends StatelessWidget {
  const PoliceLoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/panic-logo.png",
            height: 300,
          ),
          // TextField(
          //   decoration: textfielddecoration("Enter Your ID", "Enter ID"),
          // ).p(20),
          InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.policeroute);
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  border: Border.all(width: 5, color: Colors.black)),
              child: "LOGIN".text.xl3.bold.white.make().p(5),
            ),
          ),
        ],
      ),
    );
  }
}
