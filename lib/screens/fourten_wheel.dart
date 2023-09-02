import 'dart:math';

import 'package:brycs_game/provider/provider_data.dart';
import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/container_decoration.dart';
import 'package:brycs_game/widgets/scaffold_message.dart';
import 'package:brycs_game/widgets/spin_wheel.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheelPage extends StatefulWidget {
  const SpinWheelPage({super.key});

  @override
  _SpinWheelPageState createState() => _SpinWheelPageState();
}

class _SpinWheelPageState extends State<SpinWheelPage> {
  List<String> items = ["Jocker", "Gain 100 brics", "Skip the Question"];
  Random random = Random();
  final selected = BehaviorSubject<int>();
  String selectedItem = "";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppChangedData>(context);
    return Scaffold(
      body: Container(
        decoration: defaultContainerDecoration(),
        child: spinWheel(
            context: context,
            selected: selected,
            items: List.generate(items.length,
                (index) => FortuneItem(child: defaultText(txt: items[index],fontSize: 22))),
            onPressed: () {
              setState(() {
                selected.add(Fortune.randomInt(0, items.length,));
              });
            },
          onAnimatedEnd: (){
              setState(() {
                selectedItem = items[selected.value];
               if(selectedItem==items[0]){
                 provider.jockerGain();
                 provider.changeFortuneWheelState();
                 scaffoldSnackBar(context: context, message: provider.scaffoldMessage);
                 navigateTo(secondPage: const QuestionScreen(), context: context);
               }
               else if(selectedItem==items[1]){
                 provider.incrementCharge();
                 scaffoldSnackBar(context: context, message:"Getting 100 Points from Fortune Wheel Great Continue");
                 navigateTo(secondPage:const  QuestionScreen(), context: context);

               }
               else
                 {
                   scaffoldSnackBar(context: context, message: "Question Skipped");
                const Duration(seconds: 1);
                   navigateTo(secondPage: const QuestionScreen(), context: context);
                 }

              });
          }

            ),
      ),
    );
  }
}
