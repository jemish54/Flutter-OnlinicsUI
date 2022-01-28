import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Image.asset(
          "assets/images/location.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
