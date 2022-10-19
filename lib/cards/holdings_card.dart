import 'package:flutter/material.dart';

import '../constants.dart';
import '../linear_chart.dart';

class HoldingsCard extends StatelessWidget {
  const HoldingsCard(
      {Key? key,
        required this.title,
        required this.cardColor,
        required this.arrowVector,
        required this.investmentValue,
        required this.addIcon,
        required this.extraIcon})
      : super(key: key);
  final String title;
  final Color cardColor;
  final String arrowVector;
  final String investmentValue;
  final String addIcon;
  final String extraIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShowLinearChart()),
          );
        },
        child: Material(
          elevation: 30,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: 328,
            height: 128,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('images/star.png'),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(title,
                                style: const TextStyle(
                                    color: investmentHeadingColor,
                                    fontSize: holdingTitleFontSize)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('images/investmentFilled.png'),
                                const Text("  "),
                                Image.asset(arrowVector),
                                const Text("  "),
                                Image.asset(investmentValue),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text('Invested Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: investmentHeadingColor,
                                    fontSize: holdingTitleFontSize)),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Image.asset('images/1.5lac.png'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: extraIcon.isNotEmpty
                              ? const EdgeInsets.only(left: 120.0)
                              : const EdgeInsets.only(left: 170.0),
                          child: Row(
                            children: [
                              Material(
                                elevation: 30,
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(addIcon),
                                  decoration: const BoxDecoration(
                                    color: appBackgroundColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                              ),
                              extraIcon.isNotEmpty
                                  ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Material(
                                  elevation: 30,
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(extraIcon),
                                    decoration: const BoxDecoration(
                                      color: appBackgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                  ),
                                ),
                              )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: const BoxDecoration(
              color: appBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
      ),
    );
  }
}