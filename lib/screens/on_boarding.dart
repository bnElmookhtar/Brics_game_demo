import 'package:brycs_game/widgets/page_view.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            defaultPageView(
                context: context,
                txt: 'Brics Challenge',
                imagePath:
                'assets/images/on_boarding_one.jpg',
                pageNum: 0),
            defaultPageView(
                context: context,
                txt: 'Think and Answer',
                imagePath:
                'assets/images/on_boarding_two.jpg',
                pageNum: 1),
            defaultPageView(
                context: context,
                txt: 'Every Correct Answer = 100 Point ',
                imagePath:
                'assets/images/on_boarding_three.jpg',
                pageNum: 2),
          ],
        ),
      ),
    );
  }
}
