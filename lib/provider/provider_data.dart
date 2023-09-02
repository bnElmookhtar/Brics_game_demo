import 'package:brycs_game/data/local.dart';
import 'package:flutter/cupertino.dart';
import '../style/colors.dart';
import '../widgets/container.dart';

class AppChangedData extends ChangeNotifier {
  int numberOfTrying = 3;
  int charge = 0;
  BuildContext? context ;
  bool isAnswerTrue = false;
  int numberOfCorrectAnswers = 0 ;
  List<String> questionsContent = questions;
  List<String> correctAnswersContent = correctAnswers;
  List<List<String>> choosesContent = chooses;
  String scaffoldMessage = "Great Answer 😍🥰😘";
  bool isFortuneWheel = false;
  bool isSkippedQuestion = false;
  int numberOfLeftedHelpingMethods = 3;
  List<DefaultContainer> answersStackContainers = List.generate(
      10,
          (index) => DefaultContainer(
          borderRadius: 25,
          width: (60 + 10 * index) / 1,
          height: 20,
          containerColor: gray));

  void decrementNumberOfTrying() {
    if (numberOfTrying != 0) numberOfTrying--;
    notifyListeners();
  }
  void checkAnswer({required String answer}){
    if(correctAnswers.contains(answer)){
      isAnswerTrue = true;
     incrementCharge();
     scaffoldMessage = "Great Answer 😍😘";
      changeStackAnswerColor();
    }
    else{
      isAnswerTrue = false;
      scaffoldMessage = "Oops Try another Question  🙁☹️";
      decrementNumberOfTrying();
    }
    notifyListeners();
  }
  void incrementCharge(){
    charge +=100;
    notifyListeners();
  }
  void changeStackAnswerColor(){
      answersStackContainers[numberOfCorrectAnswers++].containerColor = green;
    notifyListeners();
  }
  void resetGame(){
    numberOfTrying = 3;
    charge= 0;
    numberOfCorrectAnswers = 0;
    for(int i = 0 ;i<10;i++){
      answersStackContainers[i].containerColor = gray;
    }
    isAnswerTrue = false;
    notifyListeners();
  }
  void jockerGain(){
    charge += 50;
    scaffoldMessage = "Great Getting Jocker mean you Gain 50 Points🤓😎";
    notifyListeners();
  }
  void changeFortuneWheelState(){
    isFortuneWheel = true;
    numberOfLeftedHelpingMethods --;
    notifyListeners();
  }
  void changeSkippedQuestionStatus(){
    isSkippedQuestion = true;
    numberOfLeftedHelpingMethods--;
    notifyListeners();
  }
}
