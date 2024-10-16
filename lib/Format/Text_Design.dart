// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Title extends StatelessWidget {
  final String Title_Text;
  const Text_Title({super.key, required this.Title_Text});

  @override
  Widget build(BuildContext context) {
    return Text(
      Title_Text,
      style: TextStyle(
        color: Color(0XFF071952),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

// ignore: camel_case_types
class Text_Heading extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Text_Head;
  const Text_Heading({super.key, required this.Text_Head});

  @override
  Widget build(BuildContext context) {
    return Text(
      Text_Head,
      style: TextStyle(
        color: Color(0XFF071952),
        fontSize: 35,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
