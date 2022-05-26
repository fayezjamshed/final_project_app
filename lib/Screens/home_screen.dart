import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isplaying = false;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.red.shade200,
        Colors.white,
        // Colors.red.shade100,
        Colors.red.shade400,
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {
              if (_isplaying) {
                _controller..reset();
                _isplaying = !_isplaying;
              } else {
                _controller..repeat();
                _isplaying = !_isplaying;
              }
            },
            child: Lottie.asset(
              "assets/warning.json",
              height: MediaQuery.of(context).size.height * 0.45,
              fit: BoxFit.fill,
              controller: _controller,
            ),
          )),
        ],
      ),
    );
  }
}
