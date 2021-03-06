import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinics_ui/main.dart';
import 'package:onlinics_ui/screens/detail_screen.dart';
import 'package:intl/intl.dart';

import '../CustomWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.changeTab}) : super(key: key);

  final Function(int) changeTab;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List doctorList = [];
  DocumentSnapshot? appointment;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('Doctors')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        doctorList = snapshot.docs.toList();
      });
    });
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Appointments')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        appointment = snapshot.docs.first;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var format = new DateFormat.yMMMMd('en_US').add_jm();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedAssetImage(
                      Size(48, 48), "assets/images/app_logo.jpg", 8),
                ),
                Column(
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          size: 1,
                        ),
                        Text(
                          "Vadodara,Gujarat",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () => widget.changeTab(3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: "profile-image",
                      child: ElevatedImage(
                          Size(48, 48),
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                          8),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedField(
            hint: "Search",
            iconData: CupertinoIcons.search,
            shadowColor: Colors.blue,
            getText: (value) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Schedule",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                InkWell(
                  onTap: () => widget.changeTab(2),
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          StackedCardBackground(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: appointment?.data == null
                  ? Center(
                      child: Text(
                        "No Appointments Scheduled",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  : Column(
                      children: [
                        // * Doctor Details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // * Profile Photo
                            ElevatedImage(
                                Size(48, 48),
                                "https://www.sketchappsources.com/resources/source-image/doctor-illustration-hamamzai.png",
                                12),
                            // * Name and Specialization
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment?['doctor']['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  appointment?['doctor']['type'],
                                  style: TextStyle(color: Colors.white60),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(
                                  CupertinoIcons.videocam,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              '${format.format(appointment?.get('timestamp')?.toDate())}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 35, left: 25, right: 25, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Let's find your doctor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.slider_horizontal_3,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedChip(Icons.favorite, "Heart Surgeon"),
                  ElevatedChip(Icons.medication, "Psychologist"),
                  ElevatedChip(Icons.favorite, "Heart Surgeon"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          for (int i = 0; i < doctorList.length; i++)
            DoctorCard(context, i, doctorList[i])
        ]),
      ),
    );
  }

  Widget DoctorCard(BuildContext context, int index, DocumentSnapshot doctor) {
    const String url =
        "https://www.sketchappsources.com/resources/source-image/doctor-illustration-hamamzai.png";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailScreen(
                        argument: DetailScreenArgument(index, doctor),
                      )));
        },
        child: Container(
          width: 360,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(-4, 4),
                blurRadius: 10.0,
                color: Colors.grey.withOpacity(0.14),
              ),
              BoxShadow(
                offset: Offset(3, -3),
                blurRadius: 10.0,
                color: Colors.grey.withOpacity(0.14),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Hero(
                    tag: "detail-image$index",
                    child: ElevatedImage(Size(72, 72), url, 12)),
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3),
                      Text(
                        doctor['type'],
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          StarRating(double.parse(doctor['rating'].toString())
                              .toInt()),
                          SizedBox(width: 5.0),
                          Text(
                            "| Reviews : ${doctor['reviews']}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[800]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget StarRating(int rating) {
    return Container(
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              Icons.star,
              color: rating > i ? Colors.yellow[700] : Colors.grey,
              size: 16,
            )
        ],
      ),
    );
  }

  Widget ElevatedChip(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 2),
              blurRadius: 10.0,
              color: Colors.grey.withOpacity(0.27),
            ),
            BoxShadow(
              offset: Offset(1, -1),
              blurRadius: 8.0,
              color: Colors.grey.withOpacity(0.18),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 6.0),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Widget StackedCardBackground(Widget child) {
    return Container(
      height: 186,
      width: 340,
      child: Stack(
        children: [
          Positioned(
            left: 15,
            bottom: 8,
            height: 175,
            width: 310,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[800]?.withAlpha(100),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 0,
            height: 175,
            width: 280,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[800]?.withAlpha(60),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Container(
            height: 170,
            width: 340,
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(16)),
            child: child,
          )
        ],
      ),
    );
  }
}
