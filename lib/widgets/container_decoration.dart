import 'package:flutter/cupertino.dart';

defaultContainerDecoration({
  List<Color> colors = const [
    Color(0xff0E0574),
    Color(0xff938AFF),
  ],
}) =>
    BoxDecoration(
        gradient: LinearGradient(
      colors: [
        colors[0],
        colors[1],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      transform: GradientRotation(1200),
    ),
    );
