import 'dart:io';

import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_data.dart';
import '../widgets/container_decoration.dart';

class EndOfTheGame extends StatelessWidget {
  const EndOfTheGame({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppChangedData>(context);
    return Scaffold(
      body: Container(
        decoration: defaultContainerDecoration(),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
        ),
        child: AlertDialog(
          content: Text("End of the game You earned ${provider.charge}"),
          actions: [
            defaultElevatedButton(
                onPressed: () {
                  //there is bug in stack answers color
                  provider.resetGame();
                  navigateTo(secondPage: QuestionScreen(), context: context);
                },
                buttonText: "Play Again?",
                context: context),
            defaultElevatedButton(
                onPressed: () {
                  exit(0);
                },
                buttonText: "Leave",
                context: context),
          ],
        ),
      ),
    );
  }
}
