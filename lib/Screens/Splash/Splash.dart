import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Timer(
        Duration(seconds: 1),
        () => {
          Navigator.of(context).pushReplacementNamed('/app'),
        },
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            color: Colors.grey[50],
            child: Center(
              child: Text("LOGO"),
            ),
          ),
        ),
      ),
    );
  }
}
