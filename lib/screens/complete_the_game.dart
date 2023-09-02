import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/style/colors.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/container.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_data.dart';
import '../widgets/container_decoration.dart';

class CompleteTheGame extends StatelessWidget {
  const CompleteTheGame({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppChangedData>(context);
    return Scaffold(
      body: Container(
        decoration: defaultContainerDecoration(),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            defaultText(
                txt:
                    "WE ARE SO PROUD OF YPU YOU FINISHED THE GAME SUCCESSFULLY WITH HIGHEST SCORE : ${provider.charge} BRICS",
                fontSize: 22,txtColor: orange),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/award.jpg'),
              )),
            ),
            const Spacer(),
            defaultContainer(
                borderRadius: 25,
                containerColor: Colors.orange,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    provider.resetGame();
                    navigateTo(secondPage: QuestionScreen(), context: context);
                  },
                  child: defaultText(txt: "Play Again ",fontSize: 22),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
