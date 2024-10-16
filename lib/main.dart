import 'package:flutter/material.dart';
import 'package:mp_app/dashboard.dart';

import 'package:mp_app/splash_screen.dart';
//import 'package:mp_app/signup_screen.dart';
//import 'package:mp_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
