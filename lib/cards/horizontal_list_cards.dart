import 'package:flutter/material.dart';

import '../constants.dart';

class HorizontalListCards extends StatelessWidget {
  final String heading;
  final String secondHeader;

  const HorizontalListCards({
    Key? key,
    required this.heading,
    required this.secondHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 206,
      height: 72,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(heading,
                style: const TextStyle(
                    color: Colors.black, fontSize: holdingTitleFontSize)),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(secondHeader),
            ),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 3)
        ],
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
    );
  }
}