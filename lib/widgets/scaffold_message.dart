import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

scaffoldSnackBar({required context, required String message})=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(
content: Container(
decoration: BoxDecoration(
color: gray.withOpacity(.9),
borderRadius: BorderRadius.circular(50)),
child: defaultText(
txt: message,
txtColor: blue),
),
backgroundColor: gray.withOpacity(0.0),
duration: const Duration(seconds: 1),
elevation: 0,
));