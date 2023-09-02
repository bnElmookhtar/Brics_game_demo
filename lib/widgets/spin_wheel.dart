import 'package:brycs_game/style/colors.dart';
import 'package:brycs_game/widgets/container.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

Widget spinWheel({
  required context,
  required selected,
  required items,
  required onPressed,
  required onAnimatedEnd,
}) =>
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FortuneWheel(
              items: items,
              selected: selected,
              onAnimationEnd: onAnimatedEnd,
              styleStrategy: UniformStyleStrategy(
                color: orange,
              ),
              animateFirst: false,
            ),
          ),
          defaultContainer(
            borderRadius: 25,
            containerColor: green,
            height: 50,
            child: MaterialButton(
              onPressed: onPressed,
              child: defaultText(txt: "Spin",fontSize: 22),
            ),
          ),
        ],
      ),
    );
