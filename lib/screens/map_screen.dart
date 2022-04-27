import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final String token =
      'pk.eyJ1IjoiamFtZXM1NDAiLCJhIjoiY2wyY3B6M3Y2MHJzOTNpbjJiOG1kdW1pZCJ9.MTvBomv648-Ls7-mrYKnmA';
  final String style = 'mapbox://styles/mapbox/streets-v11';

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          child: MapboxMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(22.317017, 73.173519), zoom: 14),
        accessToken: token,
        styleString: style,
        onMapCreated: (MapboxMapController controller) async {
          // Acquire current location (returns the LatLng instance)
          final result = await acquireCurrentLocation();

          // You can either use the moveCamera or animateCamera, but the former
          // causes a sudden movement from the initial to 'new' camera position,
          // while animateCamera gives a smooth animated transition
          await controller.animateCamera(
            CameraUpdate.newLatLng(result!),
          );

          // Add a circle denoting current user location
          await controller.addCircle(
            CircleOptions(
              circleRadius: 8.0,
              circleColor: '#1565C0',
              circleOpacity: 0.8,

              // YOU NEED TO PROVIDE THIS FIELD!!!
              // Otherwise, you'll get a silent exception somewhere in the stack
              // trace, but the parameter is never marked as @required, so you'll
              // never know unless you check the stack trace
              geometry: result,
              draggable: false,
            ),
          );
        },
      )),
    );
  }
}

Future<LatLng?> acquireCurrentLocation() async {
  // Initializes the plugin and starts listening for potential platform events
  Location location = new Location();

  // Whether or not the location service is enabled
  bool serviceEnabled;

  // Status of a permission request to use location services
  PermissionStatus permissionGranted;

  // Check if the location service is enabled, and if not, then request it. In
  // case the user refuses to do it, return immediately with a null result
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  // Check for location permissions; similar to the workflow in Android apps,
  // so check whether the permissions is granted, if not, first you need to
  // request it, and then read the result of the request, and only proceed if
  // the permission was granted by the user
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  // Gets the current location of the user
  final locationData = await location.getLocation();
  return LatLng(locationData.latitude!, locationData.longitude!);
}
