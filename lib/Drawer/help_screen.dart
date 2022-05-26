import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "Help Screen".text.xl5.make(),
    ));
  }
}
