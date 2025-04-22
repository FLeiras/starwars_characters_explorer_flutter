import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
