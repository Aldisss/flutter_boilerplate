import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/Themes/themes.dart';
import 'package:flutter_boilerplate/Screens/BottomNavBar/Home.dart';
import 'package:flutter_boilerplate/Screens/BottomNavBar/Profile.dart';
import 'package:flutter_boilerplate/Screens/BottomNavBar/pages.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  List<Widget> _pages = <Widget>[HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        backgroundColor: ColorThemes.primaryColor,
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _pageIndex,
          children: _pages.map((page) => page).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: Colors.white,
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: allDestination.map((Destination destination) {
          return BottomNavigationBarItem(
            activeIcon: Icon(
              destination.icon,
              color: ColorThemes.primaryColor,
            ),
            icon: Icon(
              destination.icon,
              color: Colors.black26,
            ),
            title: Text(
              destination.title,
              style: TextStyle(
                color: ColorThemes.primaryColor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
