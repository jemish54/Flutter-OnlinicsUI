import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinics_ui/CustomWidgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? username;
    String? contact;
    String? age;
    String? height;
    String? weight;
    String? gender;
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.person,
                    hint: 'Username:${snapshot.data?.get('username')}',
                    getText: (value) {
                      username = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.phone,
                    hint: 'Contact:${snapshot.data?.get('contact')}',
                    getText: (value) {
                      contact = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.person,
                    hint: 'Age:${snapshot.data?.get('age')}',
                    getText: (value) {
                      age = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.person,
                    hint: 'Height:${snapshot.data?.get('height')}',
                    getText: (value) {
                      height = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.person,
                    hint: 'Weight:${snapshot.data?.get('weight')}',
                    getText: (value) {
                      weight = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedField(
                    iconData: CupertinoIcons.person,
                    hint: 'Gender:${snapshot.data?.get('gender')}',
                    getText: (value) {
                      gender = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .update({
                        "username": username == null
                            ? snapshot.data?.get('username')
                            : username,
                        "contact": contact == null
                            ? snapshot.data?.get('contact')
                            : contact,
                        "age": age == null ? snapshot.data?.get('age') : age,
                        "height": height == null
                            ? snapshot.data?.get('height')
                            : height,
                        "weight": weight == null
                            ? snapshot.data?.get('weight')
                            : weight,
                        "gender": gender == null
                            ? snapshot.data?.get('gender')
                            : gender,
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 12),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}
