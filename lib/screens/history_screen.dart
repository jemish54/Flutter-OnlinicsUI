import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22.0, bottom: 8, left: 22),
            child: Text(
              "Schedules",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          AppointmentCard(true),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 22),
            child: Text(
              "History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          AppointmentCard(false),
        ],
      ),
    );
  }

  Widget AppointmentCard(bool isOngoing) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 18.0,
              color: Colors.grey.withOpacity(0.27),
            ),
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 18.0,
              color: Colors.grey.withOpacity(0.36),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLinQnkpj_N0CjUzF1Whl1oPDELZNjyX1IGQ&usqp=CAU"),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Anna Baker",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Heart Surgeon",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[800]?.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          color: Colors.blue[800],
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Sun, Jan 19",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          color: Colors.blue[800],
                        ),
                        SizedBox(width: 6),
                        Text(
                          "08.00am - 10.00am",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 9,
                      child: isOngoing
                          ? OutlinedButton(
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                child: Text("Cancel"),
                              ),
                              style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder()),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: StarRating(3),
                            )),
                  Spacer(flex: 1),
                  Expanded(
                      flex: 9,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            isOngoing ? "Reschedule" : "Book Again",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.blue[800]),
                      )),
                ],
              ),
            ],
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
              CupertinoIcons.star_fill,
              color: rating > i ? Colors.yellow[700] : Colors.grey,
              size: 22,
            )
        ],
      ),
    );
  }
}
