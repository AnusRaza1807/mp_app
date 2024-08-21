import 'package:flutter/material.dart';
import 'package:mp_app/format_design.dart';

// ignore: camel_case_types
class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopDesign(),
          Text(
            "Signup",
            style: TextStyle(
                color: Color(0XFF071952),
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          Text(
            "Signup to Continue",
            style: TextStyle(
                color: Color(0XFF071952),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
