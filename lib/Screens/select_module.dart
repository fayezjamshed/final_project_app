import 'package:final_project_app/Screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectModule extends StatelessWidget {
  const SelectModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spa,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/logo-with-text.png",
                height: 350,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(200),
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginroute);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.78,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(width: 5, color: Colors.white)
                      ),
                      child: "SIGN IN FOR PUBLIC".text.xl3.white.make().p(5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(200),
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginpoliceroute);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.78,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                        // border: Border.all(width: 5, color: Colors.black)
                      ),
                      child: "SIGN IN FOR POLICE".text.xl3.white.make().p(5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
