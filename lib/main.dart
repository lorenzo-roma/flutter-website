import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white,
              fontFamily: 'Source San Pro',
              fontSize: 36,
              fontWeight: FontWeight.w700),
          caption: TextStyle(
              color: Color(0xFF00FFC2),
              fontFamily: 'Montserrat',
              fontSize: 28,
              fontWeight: FontWeight.w700),
          headline2: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w600),
          bodyText1: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      home: HomePage(),
    );
  }
}
