import 'package:brycs_game/screens/question_screen.dart';
import 'package:brycs_game/style/colors.dart';
import 'package:brycs_game/transititon/animated_transition.dart';
import 'package:brycs_game/widgets/container_decoration.dart';
import 'package:brycs_game/widgets/txt.dart';
import 'package:flutter/material.dart';

Widget defaultPageView({
  required context,
  required String txt,
  required String imagePath,
  required int pageNum,
}) =>
    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: defaultContainerDecoration(),
      child: Stack(
        children: [
          Positioned(
            top: 32,
            right: 32,
            child: MaterialButton(
              onPressed: (){
                navigateTo(secondPage: const QuestionScreen(), context: context);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: orange, borderRadius: BorderRadius.circular(25)),
                child: defaultText(txt: pageNum!=2? 'Skip':'Lets Start', fontSize: 22
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            top: 32,
            left: MediaQuery.of(context).size.width / 5,
            right: MediaQuery.of(context).size.width / 5,
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image:AssetImage(imagePath),
                      fit: BoxFit.cover
                    )
                  ),

                ),
                Expanded(child:  defaultText(txt: txt,fontSize: 32),),

                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == pageNum ? orange : gray100,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
