import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';
import 'package:mp_app/Format/format_design.dart';
import 'package:mp_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  List User_profile = [];
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopDesign(),
            Text_Heading(Text_Head: "Signup"),
            Text_Title(Title_Text: "Signup to Continue"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  //_fullNameController
                  TextField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      labelText: 'Enter your Full Name',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //_userNameController
                  TextField(
                    controller: _userNameController,
                    //obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      labelText: 'Enter your User Name',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //_password Controller
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_person_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      labelText: 'Enter your Password',
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF071952),
                        fixedSize: Size(300, 50)),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('fullName', _fullNameController.text);
                      prefs.setString('userName', _userNameController.text);
                      prefs.setString('password', _passwordController.text);

                      _fullNameController.clear();
                      _userNameController.clear();
                      _passwordController.clear();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text("SignUp",
                        style: TextStyle(color: Color(0XFFEBF4F6))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          child: Text("You Have an Account!"),
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
