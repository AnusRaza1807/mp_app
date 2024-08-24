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
