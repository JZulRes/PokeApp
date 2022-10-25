import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData darkTheme() {
    return ThemeData(
      dividerColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 20),
        headline2: TextStyle(color: Colors.white, fontSize: 20),
        bodyText2: TextStyle(color: Colors.white, fontSize: 15),
        subtitle1: TextStyle(color: Colors.white, fontSize: 15),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          disabledForegroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF2a3050),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      dividerColor: Colors.black,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black, fontSize: 20),
        headline2: TextStyle(color: Colors.black, fontSize: 20),
        bodyText2: TextStyle(color: Colors.black, fontSize: 15),
        subtitle1: TextStyle(color: Colors.black, fontSize: 15),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
