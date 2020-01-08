import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi lista de regalo',
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        accentColor: Colors.red[400],
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            textTheme: TextTheme(title: TextStyle(color: Colors.indigo[200], fontSize: 25)),
            iconTheme: IconThemeData(color: Colors.indigo[200])),
        iconTheme: IconThemeData(color: Colors.indigo[200], size: 40),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red[400],
        ),
        textTheme: TextTheme(body1: TextStyle(color: Colors.blueGrey)),
      ),
      home: HomePage(),
    );
  }
}
