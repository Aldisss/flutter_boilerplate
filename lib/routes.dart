import 'package:flutter/material.dart';
import './Screens/screens.dart';

class Routes {
  Routes._();

  static const String splash = "/";
  static const String app = "/app";

  static final routes = <String, WidgetBuilder>{
    splash: (context) => SplashScreen(),
    app: (context) => BottomBar(),
  };
}
