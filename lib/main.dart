import 'package:flutter/material.dart';
import 'package:tiles_wall/routes.dart';
import 'package:tiles_wall/screens/splash_screen_layout.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      initialRoute: SplashScreenLayout.routeName,
      routes: routes,
    );
  }
}
