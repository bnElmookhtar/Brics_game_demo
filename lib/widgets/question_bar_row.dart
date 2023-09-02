import 'package:brycs_game/screens/fourten_wheel.dart';
import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/scaffold_message.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
import '../provider/provider_data.dart';
import '../style/colors.dart';
import 'elevated_button.dart';

final provider = AppChangedData();
Widget questionBarRow({required provider, required context}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: orange,
          ),
          child: defaultText(
              txt: 'Number of attempts left = ${provider.numberOfTrying}'
                  .toUpperCase(),
              fontSize: 18),
        ),
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: orange,
          ),
          child: defaultText(
              txt: 'Number of points: ${provider.charge} '.toUpperCase(),
              fontSize: 18),
        ),
        Container(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 4, vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: green,
            ),
            child:AnimatedCrossFade(firstChild: SizedBox(), secondChild:   MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (builder) => AlertDialog(
                    backgroundColor: gray.withOpacity(.7),
                    title: defaultText(
                        txt:
                        'You have ${provider.numberOfLeftedHelpingMethods} Helping methods',
                        txtColor: blue),
                    actions: [
                      defaultElevatedButton(
                          onPressed: () {
                            if (provider.isFortuneWheel) {
                              scaffoldSnackBar(
                                  context: context, message: "You Used it");
                              Navigator.pop(context);
                            } else {
                              navigateTo(
                                  secondPage: const SpinWheelPage(),
                                  context: context);
                            }
                          },
                          buttonText: 'Fortune Wheel',
                          context: context),
                      defaultElevatedButton(
                          onPressed: () {},
                          buttonText: 'Delete 2 Answers',
                          context: context),
                      defaultElevatedButton(
                          onPressed: () {
                            if (provider.isSkippedQuestion) {
                              scaffoldSnackBar(
                                  context: context, message: "You Used it");
                              Navigator.pop(context);
                            } else {
                              provider.changeSkippedQuestionStatus();
                              navigateTo(
                                  secondPage: QuestionScreen(),
                                  context: context);
                            }
                          },
                          buttonText: 'Skip question',
                          context: context),
                    ],
                  ),
                );
              },
              child: defaultText(txt: "helping methods", fontSize: 18),
            ), crossFadeState: CrossFadeState.showSecond, duration: Duration(seconds: 1))
        ),
      ],
    );
