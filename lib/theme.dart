import 'package:flutter/material.dart';

final themeLight = ThemeData.light().copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffF1F4F2),
    selectedItemColor: Colors.white,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      color: Color(0xff5B5EA6),
    ),
  ),
  dividerColor: const Color(0xffE1EBE8),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    suffixIconColor: Color(0xff9AABA6),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
  ),
);
final themeDark = ThemeData.dark().copyWith(
  dividerColor: const Color(0xffE1EBE8),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black54,
    selectedItemColor: Colors.black,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      color: Color(0xff5B5EA6),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    suffixIconColor: Color(0xff9AABA6),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.black,
  ),
);
