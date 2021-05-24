import 'package:flutter/material.dart';
import 'package:tiles_wall/screens/home_screen.dart';
import 'package:tiles_wall/screens/test_tile_screen.dart';
import 'package:tiles_wall/screens/splash_screen_layout.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreenLayout.routeName: (context) => SplashScreenLayout(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TestTileScreen.routeName: (context) => TestTileScreen(),
};
