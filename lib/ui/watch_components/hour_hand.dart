import 'dart:math';

import 'package:flutter/material.dart';

class HourHand extends StatelessWidget {
  final int currentHour;
  final double handSize;

  HourHand({@required this.currentHour, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: handSize * 1.59,
        child: Center(
            child: Transform.rotate(
          alignment: Alignment.bottomCenter,
          origin: Offset(0, -8),
          angle: currentHour * pi / 6,
          child: Container(
            height: handSize,
            child: Image.asset(
              'assets/png/hours_hand.png',
              height: handSize,
              fit: BoxFit.fitHeight,
            ),
          ),
        )));
  }
}
