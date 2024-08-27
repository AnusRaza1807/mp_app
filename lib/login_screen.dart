import 'package:flutter/material.dart';
import 'package:mp_app/Format/Text_Design.dart';
import 'package:mp_app/dashboard.dart';
import 'package:mp_app/signup_screen.dart';
import 'package:mp_app/Format/format_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text_Heading(Text_Head: "Login"),
              Text_Title(Title_Text: "Sign in to Continue"),
              SizedBox(height: 5),
              Image(
                image: AssetImage('assets/images/login_front.png'),
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                        labelText: 'Enter your username',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
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
                        String? savedUserName = prefs.getString('userName');
                        String? savedPassword = prefs.getString('password');

                        if (_userNameController.text == savedUserName &&
                            _passwordController.text == savedPassword) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        } else {
                          // Show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Invalid username or password')),
                          );
                        }
                      },
                      child: Text("Login",
                          style: TextStyle(color: Color(0XFFEBF4F6))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            child: Text("Don't Have an Account!"),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Signup_screen(),
                                  ));
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
