import 'package:app_1/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_1/TabbarExample.dart';
import 'package:app_1/Twitter.dart';
import 'package:app_1/Profile.dart';
import 'package:app_1/GridView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
