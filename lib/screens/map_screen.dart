import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  final String token =
      'pk.eyJ1IjoiamFtZXM1NDAiLCJhIjoiY2wyY3B6M3Y2MHJzOTNpbjJiOG1kdW1pZCJ9.MTvBomv648-Ls7-mrYKnmA';
  final String style = 'mapbox://styles/mapbox/streets-v11';

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: MapboxMap(
          accessToken: token,
          styleString: style,
          initialCameraPosition: CameraPosition(
            zoom: 14.0,
            target: LatLng(22.188211, 73.186796),
          ),
        ),
      ),
    );
  }
}
