import 'package:flutter/material.dart';
import 'constant.dart';

class sexContent extends StatelessWidget {
  final String sex;
  final IconData icon;

  sexContent({this.icon, this.sex});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          sex,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
