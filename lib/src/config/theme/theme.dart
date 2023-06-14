import 'package:flutter/material.dart';

abstract class ThemeImpl {
  static ThemeData get() => ThemeData();
}

class LightTheme implements ThemeImpl {
  static ThemeData get() {
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(243, 244, 252, 1),
        // Bottom Navigation Bar 색
        canvasColor: const Color.fromRGBO(236, 237, 240, 1),
        iconTheme: const IconThemeData(color: Colors.black),
        primaryColor: Color.fromRGBO(52, 120, 246, 1),
        primaryColorLight: Color.fromRGBO(89, 171, 225, 1),

        // fontFamily: 'Korail',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w900),
          //: 보통 글귀
          bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
          bodySmall: TextStyle(color: Colors.black, fontSize: 10),
        ),
        cardColor: Colors.white);
  }
}

class DarkTheme implements ThemeImpl {
  static ThemeData get() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      // Bottom Navigation Bar 색
      canvasColor: const Color.fromRGBO(30, 30, 30, 1),
      iconTheme: const IconThemeData(color: Colors.white),

      primaryColor: const Color.fromRGBO(52, 120, 246, 1),
      primaryColorLight: const Color.fromRGBO(89, 171, 225, 1),

      // fontFamily: 'Korail',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
        bodySmall: TextStyle(color: Colors.white, fontSize: 10),
      ),

      cardColor: const Color.fromRGBO(30, 30, 30, 1),
    );
  }
}
