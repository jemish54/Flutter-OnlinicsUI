import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinics_ui/Navigation.dart';
import 'package:onlinics_ui/screens/detail_screen.dart';
import 'package:onlinics_ui/screens/history_screen.dart';
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
      home: Navigation(),
    );
  }
}

class DetailScreenArgument {
  final int index;

  DetailScreenArgument(this.index);
}
