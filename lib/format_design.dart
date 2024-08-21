import 'package:flutter/material.dart';

class TopDesign extends StatelessWidget {
  const TopDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image(
          image: AssetImage(
            'assets/images/login_to_design.png',
          ),
          height: 125,
        ),
      ],
    );
  }
}

class Text_Heading extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Text_Head;
  const Text_Heading({super.key, required this.Text_Head});

  @override
  Widget build(BuildContext context) {
    return Text(
      Text_Head,
      style: TextStyle(
          color: Color(0XFF071952), fontSize: 25, fontWeight: FontWeight.w900),
    );
  }
}

class Text_Title extends StatelessWidget {
  final String Title_Text;
  const Text_Title({super.key, required this.Title_Text});

  @override
  Widget build(BuildContext context) {
    return Text(
      Title_Text,
      style: TextStyle(
          color: Color(0XFF071952), fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
