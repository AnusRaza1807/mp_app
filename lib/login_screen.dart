import 'package:flutter/material.dart';
import 'package:mp_app/signup_screen.dart';
import 'package:mp_app/format_design.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.admin_panel_settings_sharp),
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
                  onPressed: () {},
                  child:
                      Text("Login", style: TextStyle(color: Color(0XFFEBF4F6))),
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
