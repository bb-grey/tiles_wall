import 'package:flutter/material.dart';
import 'package:tiles_wall/routes.dart';
import 'package:tiles_wall/screens/home_screen.dart';
import './constans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
