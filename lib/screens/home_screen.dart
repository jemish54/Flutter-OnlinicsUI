import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinics_ui/Constants.dart';
import 'package:onlinics_ui/main.dart';

import '../CustomWidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    Icon(
                      Icons.account_tree_outlined,
                      color: Colors.blue,
                    ),
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
                            "Semarang,INA",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  CustomElevatedButton(
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR04Y9YQ59uATLECEfA605xY3za-yNLbSRtRA&usqp=CAU"))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedSearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Schedule",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            StackedCardBackground(Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  // * Doctor Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // * Profile Photo
                      ElevatedImage(
                          Size(48, 48),
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCkAMBLJMV2zScXlokpLpjnWZ65ve6OHJ8vg&usqp=CAU",
                          12),
                      // * Name and Specialization
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Haley Lawrence",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "Dermitologist",
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
                        "Sun, Jan 19, 08.00am - 10.00am",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, left: 25, right: 25, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let's find your doctor",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
            for (int i = 0; i < 5; i++) DoctorCard(context, i),
          ],
        ),
      ),
    );
  }

  Widget DoctorCard(BuildContext context, int index) {
    const String url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLinQnkpj_N0CjUzF1Whl1oPDELZNjyX1IGQ&usqp=CAU";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, Constants.DetailScreenRoute,
            arguments: DetailScreenArgument(index)),
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
                        "Dr. Anna Baker",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Heart Surgeon",
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          StarRating(3),
                          SizedBox(width: 5.0),
                          Text(
                            "| Reviews : 120",
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

  Widget ElevatedSearchField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 46,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.23),
              offset: const Offset(0, 10),
              blurRadius: 50,
            )
          ]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          CupertinoIcons.search,
          color: Colors.blue,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ]),
    );
  }
}
