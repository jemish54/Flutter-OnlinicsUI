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

Widget ElevatedImage(Size? size, String url, double radius) {
  return Container(
    width: size?.width,
    height: size?.height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(url),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(2, 2),
          blurRadius: 14.0,
          color: Colors.grey.withOpacity(0.18),
        ),
        BoxShadow(
          offset: Offset(1, 1),
          blurRadius: 12.0,
          color: Colors.grey.withOpacity(0.9),
        ),
      ],
    ),
  );
}

Widget ElevatedField({
  required String hint,
  required IconData iconData,
  Color shadowColor = Colors.grey,
  bool isPassword = false,
  required Function getText,
}) {
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
            color: shadowColor.withOpacity(0.23),
            offset: const Offset(0, 10),
            blurRadius: 50,
          )
        ]),
    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Icon(
        iconData,
        color: Colors.blue,
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: TextFormField(
          obscureText: isPassword,
          onChanged: (value) {
            getText(value);
          },
          decoration: InputDecoration(
            hintText: hint,
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

Widget ElevatedAssetImage(Size? size, String asset, double radius) {
  return Container(
    width: size?.width,
    height: size?.height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(asset),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(2, 2),
          blurRadius: 14.0,
          color: Colors.grey.withOpacity(0.18),
        ),
        BoxShadow(
          offset: Offset(1, 1),
          blurRadius: 12.0,
          color: Colors.grey.withOpacity(0.9),
        ),
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
