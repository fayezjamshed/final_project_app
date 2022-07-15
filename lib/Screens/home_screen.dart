import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late AudioPlayer player;

  double scale = 0.8;
  bool _isplaying = false;
  double _width = 150;
  double _height = 150;
  bool animateContainer = false;
  PermissionStatus? _permissionGranted;
  Location location = Location();
  LocationData? _currentPosition;

  void getLocation() async {
    // Location location = new Location();
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    } else {
      _currentPosition = await location.getLocation();
      setState(() {
        print(_currentPosition?.latitude);
        print(_currentPosition?.longitude);
      });
      // currentLocation.onLocationChanged.listen((LocationData loc) {
      //   print(loc.latitude);
      //   print(loc.longitude);
      //   if (this.mounted) {
      //     // check whether the state object is in tree
      //     setState(() {});
      //   }
      // });
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    // _controller.addListener(() {});
    _animation = Tween<double>(begin: 1, end: 0.35).animate(_controller);
    player = AudioPlayer();

    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.fastOutSlowIn,
    // );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.grey.shade500, width: 10),
              borderRadius: BorderRadius.circular(200)),
          child: InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () async {
              await player.setAsset('assets/audio/Police.mp3');
              player.setVolume(0.1);
              if (_isplaying) {
                _controller.reset();
                _isplaying = !_isplaying;
                player.stop();
              } else {
                _controller.repeat(reverse: true);
                _isplaying = !_isplaying;

                player.play();
                getLocation();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(200)),
              child: "ALERT".text.xl5.white.bold.make().centered(),
            ).p(30),
          ),
        ),
      ),
    );
    // return Container(
    //   // decoration: BoxDecoration(
    //   //     gradient: RadialGradient(colors: [
    //   //   Colors.white,
    //   //   Colors.white,
    //   //   Colors.white,
    //   //   Colors.white,
    //   //   Colors.white,
    //   //   Colors.red.shade200,
    //   //   Colors.white,
    //   //   // Colors.red.shade100,
    //   //   Colors.red.shade400,
    //   // ])),
    //   child:

    //    Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Center(
    //           child: InkWell(
    //         borderRadius: BorderRadius.circular(200),
    //         onTap: () {
    //           if (_isplaying) {
    //             _controller..reset();
    //             _isplaying = !_isplaying;
    //           } else {
    //             _controller..repeat();
    //             _isplaying = !_isplaying;
    //           }
    //         },
    //         child: Lottie.asset(
    //           "assets/warning.json",
    //           height: MediaQuery.of(context).size.height * 0.45,
    //           fit: BoxFit.fill,
    //           controller: _controller,
    //         ),
    //       )),
    //     ],
    //   ),
    // );
  }
}
