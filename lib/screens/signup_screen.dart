import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinics_ui/AuthWrapper.dart';
import 'package:onlinics_ui/screens/login_screen.dart';

class SignupScreen extends ConsumerStatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<bool> proceed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String name = "";
    String email = "";
    String password = "";
    String cno = "";
    String age = "";
    return SafeArea(
        child: Material(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    child: Image(
                      image: AssetImage("assets/images/signup.jpg"),
                      height: 270,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 35),
                  LoginElevatedField(
                      hint: "Name",
                      iconData: CupertinoIcons.person,
                      getText: (text) {
                        name = text;
                      },
                      isPassword: false,
                      validate: (name) {
                        if (name.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  LoginElevatedField(
                      hint: "E-mail",
                      iconData: CupertinoIcons.mail,
                      getText: (text) {
                        email = text;
                      },
                      isPassword: false,
                      validate: (email) {
                        if (email.isEmpty) {
                          return "Please Enter E-mail";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  LoginElevatedField(
                      hint: "Password",
                      iconData: CupertinoIcons.lock_circle,
                      getText: (text) {
                        password = text;
                      },
                      isPassword: true,
                      validate: (password) {
                        if (password.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  LoginElevatedField(
                      hint: "Contact no.",
                      iconData: CupertinoIcons.phone,
                      getText: (text) {
                        cno = text;
                      },
                      isPassword: false,
                      validate: (cno) {
                        if (cno.isEmpty) {
                          return "Please Enter Contact number";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  LoginElevatedField(
                      hint: "Age",
                      iconData: CupertinoIcons.person,
                      getText: (text) {
                        age = text;
                      },
                      isPassword: false,
                      validate: (age) {
                        if (age.isEmpty) {
                          return "Please Enter Age";
                        }
                        return null;
                      }),
                  SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: () async {
                      await proceed(context)
                          ? await ref.read(authServiceProvider).signUp(
                                email: email,
                                password: password,
                              )
                          : {};
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 12),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
