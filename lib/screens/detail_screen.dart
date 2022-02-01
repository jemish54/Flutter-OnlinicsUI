import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:onlinics_ui/CustomWidgets.dart';
import 'package:onlinics_ui/main.dart';

class DetailScreen extends StatelessWidget {
  final DetailScreenArgument argument;
  const DetailScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.center,
        child: ElevatedContainer(
            radius: 20,
            color: Colors.blue,
            child: Center(
                child: Text(
              "Make Appointment",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )),
            size: Size(370, 70)),
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
                      tag: 'detail-image${argument.index}',
                      child: ElevatedImage(
                        Size(140, 220),
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLinQnkpj_N0CjUzF1Whl1oPDELZNjyX1IGQ&usqp=CAU",
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
                            "Dr. Anna Baker",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Heart Surgeon",
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
                                    "4.5 out of 5",
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

  Widget ElevatedContainer(
      {Size? size = null,
      double radius = 12.0,
      Color shadowColor = Colors.grey,
      Color color = Colors.white,
      required Widget child}) {
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: Offset(-2, 2),
            blurRadius: 15.0,
            color: shadowColor.withOpacity(0.18),
          ),
          BoxShadow(
            offset: Offset(1, -1),
            blurRadius: 12.0,
            color: shadowColor.withOpacity(0.9),
          ),
        ],
      ),
      child: child,
    );
  }
}
