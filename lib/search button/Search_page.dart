import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/sansk/AndroidStudioProjects/ombre/lib/other%20buttons/1.dart';
import 'file:///C:/Users/sansk/AndroidStudioProjects/ombre/lib/other%20buttons/2.dart';
import 'file:///C:/Users/sansk/AndroidStudioProjects/ombre/lib/other%20buttons/3.dart';

import 'file:///C:/Users/sansk/AndroidStudioProjects/ombre/lib/search%20button/search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  var _bottomNavIndex = 3;

  List<Widget> _widgetOptions = [
    first(),
    Second(),
    Third(),
    Search(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AwesomeBottomNav(
          icons: [
            Icons.home_outlined,
            Icons.add_outlined,
            Icons.category_outlined,
            Icons.search_outlined,
          ],
          highlightedIcons: [
            Icons.home,
            Icons.add,
            Icons.category,
            Icons.search,
          ],
          onTapped: (int value) {
            setState(() {
              _bottomNavIndex = value;
            });
          },
          bodyBgColor: Colors.black,
          highlightColor: Colors.pink[400],
          navFgColor: Colors.white,
          navBgColor: Color(0XFFFF263240),
        ),
        body: _widgetOptions[_bottomNavIndex]);
  }
}
