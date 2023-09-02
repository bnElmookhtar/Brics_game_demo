import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

Widget defaultElevatedButton(
        {required onPressed, required String buttonText, required context}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        maximumSize: Size(MediaQuery.of(context).size.width / 3, 50),
      ),
      child: defaultText(txt: buttonText, fontSize: 24),
    );
