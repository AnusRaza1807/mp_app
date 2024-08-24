import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';
import 'package:mp_app/Format/format_design.dart';

// ignore: camel_case_types
class Signup_screen extends StatelessWidget {
  const Signup_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopDesign(),
          Text_Heading(Text_Head: "Signup"),
          Text_Title(Title_Text: "Signup to Continue")
        ],
      ),
    );
  }
}
