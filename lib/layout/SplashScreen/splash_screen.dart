import 'dart:async';
import 'package:arwyapp/layout/home_screen.dart';
import 'package:arwyapp/moduels/LoginScreen/LogiScreen.dart';
import 'package:arwyapp/shared/components/Components.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  bool loginIn;
  SplashScreen({required this.loginIn});

  @override
  State<SplashScreen> createState() => _SplashScreenState(
        loginIn: loginIn,
      );
}

class _SplashScreenState extends State<SplashScreen> {
  bool loginIn;

  _SplashScreenState({required this.loginIn});
  late Timer timer;
  startDelay() {
    timer = Timer(Duration(seconds: 2), () {
      if (loginIn == true) {
        NavigateAndFinish(context, HomeScreen());
      } else {
        NavigateAndFinish(context, LoginScreen());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Image.asset(
          'assets/images/erwy.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
        )),
      ),
    );
  }
}
