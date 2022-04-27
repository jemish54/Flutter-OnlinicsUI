import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinics_ui/AuthWrapper.dart';
import 'package:onlinics_ui/CustomWidgets.dart';
import 'package:onlinics_ui/screens/edit_profile_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 240,
                    margin: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 20),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ElevatedImage(
                            Size(400, 190),
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSym7JJvK-VP8JjDBxKOPCSe7AEGs4u3QsCgg&usqp=CAU",
                            20),
                        Positioned(
                          top: 116,
                          left: 10,
                          child: CustomElevatedButton(
                            IconButton(
                              onPressed: () async =>
                                  ref.read(authServiceProvider).signOut(),
                              icon: Icon(CupertinoIcons.square_arrow_right),
                              color: Colors.red[800],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 116,
                          right: 10,
                          child: CustomElevatedButton(
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const EditProfileScreen()));
                              },
                              icon: Icon(CupertinoIcons.pen),
                              color: Colors.blue[800],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 114,
                          child: Hero(
                            tag: "profile-image",
                            child: ElevatedImage(
                                Size(126, 126),
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                                20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${snapshot.data?.get('username')}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 30),
                    child: Column(
                      children: [
                        SingleDetail(CupertinoIcons.person, "Gender",
                            "${snapshot.data?.get('gender')}"),
                        SingleDetail(CupertinoIcons.location, "Location",
                            "Vadodara,Gujarat"),
                        SingleDetail(CupertinoIcons.person, "Age",
                            '${snapshot.data?.get('age')}'),
                        SingleDetail(CupertinoIcons.person, "Height",
                            "${snapshot.data?.get('height')}"),
                        SingleDetail(CupertinoIcons.person, "Weight",
                            "${snapshot.data?.get('weight')}"),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget SingleDetail(IconData iconData, String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(
        children: [
          CustomElevatedButton(Icon(
            iconData,
            color: Colors.blue,
          )),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(key),
              SizedBox(height: 3),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// FirestoreService.firestore
//       .collection('Users')
//       .doc(user?.uid)
//       .get()
//       .then((value) {
//     appUser = new CustomUser(
//       username: value.data()!['username'],
//       email: value.data()!['email'],
//       contact: value.data()!['contact'],
//       age: value.data()!['age'],
//     );