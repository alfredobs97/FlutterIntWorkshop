import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final lightBlue = const Color(0xFF9DBFE2);
  final red = const Color(0xFFF48A81);
  final grey = const Color(0xFF7B717F);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi lista de regalo',
      theme: ThemeData(
        primaryColor: lightBlue,
        accentColor: red,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            textTheme: TextTheme(title: TextStyle(color: grey, fontSize: 25)),
            iconTheme: IconThemeData(color: lightBlue)),
        iconTheme: IconThemeData(color: lightBlue, size: 40),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: red,
          foregroundColor: Colors.white
        ),
        textTheme: TextTheme(body1: TextStyle(color: Colors.grey)),
      ),
      home: HomePage(),
    );
  }
}
