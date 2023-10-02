import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dependency/homepage.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: AnimatedSplashScreen(
          animationDuration: Duration(seconds: 2),
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 200,
          splash: Container(
            width: 390,
            height: 800,
            child: Image.asset("assets/quiz-transformed.png"),
          ),
          nextScreen: Homepage()),
    );
  }
}
