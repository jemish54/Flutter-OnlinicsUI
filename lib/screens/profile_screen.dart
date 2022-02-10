import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinics_ui/AuthWrapper.dart';
import 'package:onlinics_ui/CustomWidgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
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
                        onPressed: () {},
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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR04Y9YQ59uATLECEfA605xY3za-yNLbSRtRA&usqp=CAU",
                          20),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Sophie Johnson",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
              child: Column(
                children: [
                  SingleDetail(CupertinoIcons.doc, "Appointments", "12"),
                  SingleDetail(CupertinoIcons.person, "Gender", "Female"),
                  SingleDetail(
                      CupertinoIcons.location, "Location", "Semarang, INA"),
                  SingleDetail(CupertinoIcons.person, "Age", "26"),
                  SingleDetail(CupertinoIcons.person, "Height", "200"),
                  SingleDetail(CupertinoIcons.person, "Weight", "70"),
                ],
              ),
            )
          ],
        ),
      ),
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
