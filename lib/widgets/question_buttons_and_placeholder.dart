import 'package:brycs_game/screens/complete_the_game.dart';
import 'package:brycs_game/screens/end_game.dart';
import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/scaffold_message.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_data.dart';
import '../style/colors.dart';
import 'container.dart';
Widget questionButtonsAndPlaceholder({
  required context,
  required String question,
  required List<String> answers,
})=>Column(
  children: [
    defaultContainer(
      containerColor: orange,
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Center(child: defaultText(txt: question,fontSize: 24))
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            checkChoosedAnswer(answer: answers[0],context: context);
          },
          child: defaultContainer(
            containerColor: orange,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 3,
            child: Center(child: defaultText(txt: answers[0],fontSize: 22)),
          ),
        ),
        InkWell(
          onTap: (){

            checkChoosedAnswer(answer: answers[1],context: context);
          },
          child:  defaultContainer(
            containerColor: orange,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 3,
            child:Center(child: defaultText(txt: answers[1],fontSize: 22)),
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            checkChoosedAnswer(answer: answers[2],context: context);
          },
          child: defaultContainer(
            containerColor: orange,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 3,
            child: Center(child: defaultText(txt: answers[2],fontSize: 22)),
          ),
        ),
        InkWell(
          onTap: (){
            checkChoosedAnswer(answer: answers[3],context: context);
          },
          child: defaultContainer(
            containerColor: orange,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 3,
            child: Center(child: defaultText(txt: answers[3],fontSize: 22)),
          ),
        ),
      ],
    ),
  ],
);

void checkChoosedAnswer({required String answer,required context}){
  final provider = Provider.of<AppChangedData>(context,listen: false);
  provider.checkAnswer(answer: answer);
  scaffoldSnackBar(context: context, message: provider.scaffoldMessage);
  Future.delayed(const Duration(milliseconds: 500));
  if(provider.numberOfTrying==0){
    print("if");
    navigateTo(secondPage: EndOfTheGame(), context: context);
  }
  else if(provider.numberOfCorrectAnswers==10){
    print("else if");
    navigateTo(secondPage: CompleteTheGame(), context: context);
  }
  else
 navigateTo(secondPage: QuestionScreen(), context: context);
}
