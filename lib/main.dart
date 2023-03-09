import 'package:flutter/material.dart';
import 'package:tappeddev_interview_project/home.dart';
import 'package:tappeddev_interview_project/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: const Home(),
    ),
  );
}
