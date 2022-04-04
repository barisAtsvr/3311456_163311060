import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v3311456_163311060/screens/homePage.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/splashicon.jpg'),),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      nextScreen: HomePage(),
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.black45,
    );
  }
}
