import 'package:flutter/material.dart';

Widget defaultText({
  required String txt,
  Color txtColor = Colors.white,
  double fontSize = 48,
  TextAlign txtAlign = TextAlign.center,
})=>Text(
   txt,
  textAlign: txtAlign,
  style: TextStyle(
    fontSize: fontSize,
    color: txtColor,
  ),
);