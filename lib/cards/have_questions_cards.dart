import 'package:flutter/material.dart';

import '../constants.dart';

class HaveQuestionsCards extends StatelessWidget {
  final String heading;
  final String iconsHaveQuestions;

  const HaveQuestionsCards({
    Key? key,
    required this.heading,
    required this.iconsHaveQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            elevation: 30,
            borderRadius: BorderRadius.circular(200.0),
            child: Container(
              width: 46,
              height: 46,
              child: Image.asset(iconsHaveQuestions),
              decoration: const BoxDecoration(
                color: appBackgroundColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
            heading,
            style: const TextStyle(
                color: Colors.black, fontSize: secondaryFontSizeSecond),
          ),
        ],
      ),
    );
  }
}