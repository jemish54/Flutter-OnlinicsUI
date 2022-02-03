import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinics_ui/screens/history_screen.dart';
import 'package:onlinics_ui/screens/home_screen.dart';
import 'package:onlinics_ui/screens/map_screen.dart';
import 'package:onlinics_ui/screens/profile_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentScreen = 0;
  late final List screenList = [
    HomeScreen(
      changeTab: onTabChange,
    ),
    MapScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
  final List labelList = [
    "Home",
    "Location",
    "History",
    "Profile",
  ];
  final List filledIconList = [
    CupertinoIcons.home,
    CupertinoIcons.location_solid,
    CupertinoIcons.square_list_fill,
    CupertinoIcons.person_fill
  ];
  final List outlinedIconList = [
    CupertinoIcons.home,
    CupertinoIcons.location,
    CupertinoIcons.square_list,
    CupertinoIcons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.54),
                offset: Offset(0, 2),
                blurRadius: 40)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(27), topRight: Radius.circular(27)),
          child: WaterDropNavBar(
            backgroundColor: Colors.white,
            barItems: [
              for (int i = 0; i < screenList.length; i++)
                BarItem(
                  filledIcon: filledIconList[i],
                  outlinedIcon: outlinedIconList[i],
                )
            ],
            onItemSelected: onTabChange,
            selectedIndex: currentScreen,
            inactiveIconColor: Colors.grey,
            bottomPadding: 15,
            waterDropColor: Colors.blue[800]!,
          ),
        ),
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
