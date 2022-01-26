import 'package:flutter/material.dart';

Widget CustomElevatedButton(Widget child) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.0),
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
      child: child,
    ),
  );
}
