import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:onlinics_ui/CustomWidgets.dart';
import 'package:onlinics_ui/main.dart';

class DetailScreen extends StatefulWidget {
  final DetailScreenArgument argument;
  const DetailScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.center,
        child: InkWell(
          child: ElevatedContainer(
            radius: 20,
            color: Colors.blue,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 2000),
              child: Center(
                  child: Text(
                "Make Appointment",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              )),
            ),
            size: Size(size.width - 40, 70),
          ),
          onTap: () => addAppointment(context, widget.argument),
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(offset: Offset(0, -2), color: Colors.grey, blurRadius: 20.0)
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.chevron_back,
                        color: Colors.blue,
                      ),
                    )),
                    CustomElevatedButton(Icon(
                      CupertinoIcons.mail,
                      color: Colors.blue,
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'detail-image${widget.argument.index}',
                      child: ElevatedImage(
                        Size(140, 220),
                        "https://www.sketchappsources.com/resources/source-image/doctor-illustration-hamamzai.png",
                        18,
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.argument.doctor['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.argument.doctor['type'],
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomElevatedButton(Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.yellow[700],
                              )),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Rating"),
                                  SizedBox(height: 2),
                                  Text(
                                    "${widget.argument.doctor['rating']} out of 5",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CustomElevatedButton(Icon(
                                CupertinoIcons.person_3_fill,
                                color: Colors.blue[700],
                              )),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Patients"),
                                  SizedBox(height: 2),
                                  Text(
                                    "100+",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ElevatedContainer(
                  radius: 20,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Biography",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                            "Dr. Anna Baker is an Indonasian Heart Surgeon specialist.She practices general at Elizabeth Hospital in Semerang... Read More"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        ElevatedImage(
                          Size(310, 180),
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHnJT7iZ539cOwPDRW42ZyHYzabrkKw9glMQ&usqp=CAU",
                          20,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ReviewRow(),
                        ReviewRow(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ReviewRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedImage(
            Size(54, 54),
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnS1o3mO3S_Nkfw1WAGaRJ6KaOGgODpfoOsA&usqp=CAU",
            14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alexandra Hudson",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("Good Experience")
            ],
          ),
          CustomElevatedButton(Center(
            child: Text(
              "4.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ))
        ],
      ),
    );
  }
}

Future<void> addAppointment(
    BuildContext context, DetailScreenArgument argument) async {
  DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      primaryColor: Colors.blue[800],
      startInitialDate: DateTime.now(),
      borderRadius: Radius.circular(12));
  if (dateTime != null) {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Appointments')
        .add({
      "doctorUid": argument.doctor.id,
      "doctor": {
        "name": argument.doctor['name'],
        "type": argument.doctor['type'],
      },
      "timestamp": Timestamp.fromDate(dateTime),
      "booktime": Timestamp.fromDate(DateTime.now())
    });
  }
}
