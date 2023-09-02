import 'dart:math';
import 'package:brycs_game/data/local.dart';
import 'package:brycs_game/screens/end_game.dart';
import 'package:brycs_game/widgets/container.dart';
import 'package:brycs_game/widgets/container_decoration.dart';
import 'package:brycs_game/widgets/question_bar_row.dart';
import 'package:brycs_game/widgets/question_buttons_and_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_data.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Random randomQuestion = Random();
  String question = "";
  List<String> answers = [];
  int questionIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionIndex = randomQuestion.nextInt(questions.length - 1);
    question = provider.questionsContent[questionIndex];
    answers = provider.choosesContent[questionIndex];
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppChangedData>(context);
    return Scaffold(
      body: questions.length == 1
          ? const EndOfTheGame()
          : Container(
              decoration: defaultContainerDecoration(),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: questionBarRow(provider: provider, context: context)
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: List.generate(
                                10,
                                (index) => Positioned(
                                      bottom: 16 + index * 28,
                                      left: 4,
                                      child: Consumer<AppChangedData>(
                                        builder: (BuildContext context,
                                                AppChangedData value,
                                                Widget? child) =>
                                            value.answersStackContainers[index]
                                                .defaultContainer(),
                                      ),
                                    )),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: defaultContainer(
                            child: questionButtonsAndPlaceholder(
                              context: context,
                              answers: answers,
                              question: question,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
