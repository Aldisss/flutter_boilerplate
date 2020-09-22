import 'package:flutter/material.dart';
import '../Themes/themes.dart';

class InitialView extends StatelessWidget {
  final String title;
  InitialView({
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: FontThemes.title,
      ),
    );
  }
}
