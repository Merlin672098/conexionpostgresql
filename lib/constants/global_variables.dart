import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 201, 29, 29),
      Color.fromARGB(255, 255, 255, 255),
      
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 201, 29, 29);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.black87;
  static const unselectedNavBarColor = Colors.black87;

}
