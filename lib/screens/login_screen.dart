import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinics_ui/Constants.dart';
import 'package:onlinics_ui/Navigation.dart';
import 'package:onlinics_ui/screens/home_screen.dart';

import '../CustomWidgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Column(children: [
          Card(
            elevation: 1,
            child: Image(
              image: AssetImage("assets/images/login.jpg"),
              height: 270,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              ElevatedField(hint: "User ID", iconData: CupertinoIcons.person),
              SizedBox(
                height: 21,
              ),
              ElevatedField(
                  hint: "Password",
                  iconData: CupertinoIcons.lock,
                  isPassword: true),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 25, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password?",
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ContextAction) => Navigation()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ]),
      ),
    );
  }
}
