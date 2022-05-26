import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.black12),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.center,

        // mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              launchUrlString('tel://03036206521');
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.redAccent, Colors.purple]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Ambulamce".text.xl2.white.bold.make(),
                  "1122".text.xl2.white.make()
                ],
              ).p(10),
            ).p(10),
          ),
          GestureDetector(
            onTap: () async {
              launchUrlString('tel://03036206521');
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.redAccent, Colors.purple]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Traffic Police".text.xl2.white.bold.make(),
                  "+92 42 99211558".text.xl2.white.make()
                ],
              ).p(10),
            ).p(10),
          ),
          GestureDetector(
            onTap: () async {
              launchUrlString('tel://15');
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.redAccent, Colors.purple]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Police".text.xl2.white.bold.make(),
                  "15".text.xl2.white.make()
                ],
              ).p(10),
            ).p(10),
          ),
          GestureDetector(
            onTap: () async {
              launchUrlString('tel://130');
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.redAccent, Colors.purple]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Moterway Police Helpline".text.xl2.white.bold.make(),
                  "130".text.xl2.white.make()
                ],
              ).p(10),
            ).p(10),
          ),
        ],
      ),
    );
  }
}
