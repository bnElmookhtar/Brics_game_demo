import 'dart:async';

import 'package:brycs_game/screens/on_boarding.dart';
import 'package:brycs_game/style/colors.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/container_decoration.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () { navigateTo(secondPage:const  OnBoarding(), context: context);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: defaultContainerDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defaultText(txt: 'Who will Win 1000 Brics??'),
                CircularProgressIndicator(
                  color:white,
                  strokeWidth: 10,
                  strokeAlign: 5,

                ),
              ],
            )

        ),
      ),
    );
  }
}
