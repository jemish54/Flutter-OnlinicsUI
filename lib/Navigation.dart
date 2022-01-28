import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinics_ui/screens/detail_screen.dart';
import 'package:onlinics_ui/screens/home_screen.dart';
import 'package:onlinics_ui/screens/map_screen.dart';
import 'package:onlinics_ui/screens/profile_screen.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentScreen = 0;
  final List screenList = [
    HomeScreen(),
    DetailScreen(),
    MapScreen(),
    ProfileScreen(),
  ];
  final List labelList = [
    "Home",
    "Detail",
    "Location",
    "Profile",
  ];
  final List iconList = [
    CupertinoIcons.home,
    CupertinoIcons.square_list,
    CupertinoIcons.location,
    CupertinoIcons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabChange,
        currentIndex:
            currentScreen, // this will be set when a new tab is tapped
        items: [
          for (int i = 0; i < screenList.length; i++)
            BottomNavigationBarItem(
              icon: BottomIcon(false, iconList[i]),
              activeIcon: BottomIcon(true, iconList[i]),
              label: labelList[i],
            ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: screenList[currentScreen],
    );
  }

  Widget BottomIcon(bool isActive, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: new Icon(
        iconData,
        size: 26,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }

  void onTabChange(int index) {
    setState(() {
      currentScreen = index;
    });
  }
}
