import 'package:flutter/material.dart';

class NavigationWithAnimation extends PageRouteBuilder {
  final page;
  NavigationWithAnimation({required this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (context, animation, animationTwo, child) {
             var begin = 0.0, end = 1.0;
              var tween = Tween(end: end, begin: begin);
               var curvedAnimation =
                 CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
              return RotationTransition(turns: tween.animate(curvedAnimation),child: child,);
            });
}

navigateTo({required secondPage, required context}) =>
    Navigator.push(context, NavigationWithAnimation(page: secondPage));
