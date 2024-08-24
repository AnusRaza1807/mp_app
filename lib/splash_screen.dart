import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';

import 'package:mp_app/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), _routPage);
  }

  void _routPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // ignore: unused_element
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   "Welcome To Attendance App",
            //   style: TextStyle(
            //       color: Color(0XFF071952),
            //       fontSize: 20,
            //       fontWeight: FontWeight.w900),
            // ),
            const Text_Heading(Text_Head: "Welcome Back to Mobile App"),
            Container(
              height: 300,
              width: 300,
              child: const Image(
                  image: AssetImage('assets/images/splash_screen_500px.gif')),
            ),
          ],
        ),
      ),
    );
  }
}
