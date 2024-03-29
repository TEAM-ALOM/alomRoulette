import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CustomBottomBar(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Color.fromRGBO(172, 227, 251, 1),
          titleTextStyle: TextStyle(
            fontSize: Sizes.size14 + Sizes.size7,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(172, 227, 251, 1),
          ),
        ),
        primaryColor: const Color.fromRGBO(172, 227, 251, 1),
      ),
    );
  }
}
