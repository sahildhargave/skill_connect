//import "package:flutter/material.dart";
//import "../Ui/homePage.dart";
//import '../Constant%20File/pallete.dart';
//
//class BottomNavigation extends StatefulWidget {
//  const BottomNavigation({Key? key}) : super(key: key);
//
//  @override
//  _BottomNavigationState createState() => _BottomNavigationState();
//}
//
//class _BottomNavigationState extends State<BottomNavigation> {
//  int current_index = 0;
//  final List<Widget> pages = [
//    HomePage(),
//  ];
//  void OnTapped(int index) {
//    setState(() {
//      current_index = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        backgroundColor: Pallete.whiteColor,
//        body: IndexedStack(
//          index: current_index,
//          children: pages,
//        ),
//        bottomNavigationBar: Container(
//          height: 90,
//          child: BottomNavigationBar(
//              type: BottomNavigationBarType.fixed,
//              backgroundColor: Pallete.whiteColor,
//              iconSize: 20.0,
//              selectedIconTheme: const IconThemeData(
//                  size: 28.0, color: Pallete.firstSuggestionBoxColor),
//              selectedItemColor: Pallete.blackColor,
//              selectedFontSize: 16.0,
//              unselectedItemColor: Pallete.greyColorN,
//              unselectedFontSize: 12,
//              currentIndex: current_index,
//              items: const <BottomNavigationBarItem>[
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.home),
//                  label: "Home",
//                ),
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.calendar_month_outlined),
//                  label: "Meetings",
//                ),
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.favorite_border_outlined),
//                  label: "Saved",
//                ),
//                BottomNavigationBarItem(
//                  icon: Icon(Icons.settings),
//                  label: "Setting",
//                ),
//              ]),
//        ));
//  }
//}
