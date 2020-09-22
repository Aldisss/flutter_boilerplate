import 'package:flutter/material.dart';

class Destination {
  final String title;
  final IconData icon;
  const Destination(this.title, this.icon);
}

const List<Destination> allDestination = <Destination>[
  Destination("Home", Icons.home),
  Destination("Profile", Icons.person),
];
