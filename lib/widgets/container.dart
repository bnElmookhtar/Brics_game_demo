import 'package:flutter/material.dart';

class DefaultContainer {
  Widget? child;
  double borderRadius = 25;
  double width = 200;
  double height = 100;
  Color? containerColor;
  DefaultContainer(
      {this.child,
        required this.borderRadius,
        required this.width,
        required this.height,
        required this.containerColor});
  Widget defaultContainer() => Container(
    padding:
    const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 4),
    margin:
    const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 2),
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: child,
  );
}
Widget defaultContainer({
  Widget? child,
  double borderRadius = 25,
  double width = 200,
  double height = 100,
  Color? containerColor,
})=>Container(
  padding:const  EdgeInsetsDirectional.symmetric(horizontal: 4,vertical: 4),
  margin:const  EdgeInsetsDirectional.symmetric(horizontal: 4,vertical: 2),
  height:height,
  width: width,
  decoration: BoxDecoration(
    color:containerColor,
    borderRadius: BorderRadius.circular(borderRadius),
  ),
  child: child,
);
