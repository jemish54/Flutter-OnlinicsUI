import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinics_ui/AuthWrapper.dart';
import 'package:onlinics_ui/screens/signup_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<bool> proceed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    return SafeArea(
      child: SingleChildScrollView(
        child: Material(
          color: Colors.white,
          child: Form(
            key: _formKey,
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
                  LoginElevatedField(
                    hint: "User ID",
                    iconData: CupertinoIcons.person,
                    getText: (text) {
                      email = text;
                    },
                    validate: (email) {
                      if (email.isEmpty) {
                        return "Please Enter User ID";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  LoginElevatedField(
                    hint: "Password",
                    iconData: CupertinoIcons.lock,
                    isPassword: true,
                    getText: (text) {
                      password = text;
                    },
                    validate: (password) {
                      if (password.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 25, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: () async {
                      await proceed(context)
                          ? await ref
                              .read(authServiceProvider)
                              .logIn(email: email, password: password)
                          : {};
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 12),
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
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?  "),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupScreen()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Or Sign in with"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            shape: CircleBorder(),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.mail,
                                    size: 35,
                                  ),
                                )),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget LoginElevatedField({
  required String hint,
  required IconData iconData,
  Color shadowColor = Colors.grey,
  bool isPassword = false,
  required Function getText,
  required Function validate,
}) {
  return Stack(children: [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 46,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.23),
              offset: const Offset(0, 10),
              blurRadius: 50,
            )
          ]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          iconData,
          color: Colors.blue,
        ),
        SizedBox(
          width: 10.0,
        ),
      ]),
    ),
    Padding(
      padding: EdgeInsets.only(left: 70, right: 45),
      child: TextFormField(
        obscureText: isPassword,
        onChanged: (value) {
          getText(value);
        },
        validator: (value) => validate(value),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    ),
  ]);
}
