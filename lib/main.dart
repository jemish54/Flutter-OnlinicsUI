import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinics_ui/screens/detail_screen.dart';
import 'package:onlinics_ui/screens/home_screen.dart';
import 'package:onlinics_ui/screens/map_screen.dart';
import 'package:onlinics_ui/screens/profile_screen.dart';
import 'package:onlinics_ui/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      title: "Onlinics",
      darkTheme: ThemeData(),
      home: Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(offset: Offset(0, -1), blurRadius: 15, color: Colors.grey)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.square_list),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.location),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.person),
              ),
            ],
          ),
        ),
        body: HomeScreen(),
      ),
      routes: {
        Constants.DetailScreenRoute: (_) => DetailScreen(),
        Constants.MapScreenRoute: (_) => MapScreen(),
        Constants.ProfileScreenRoute: (_) => ProfileScreen(),
      },
    );
  }
}
