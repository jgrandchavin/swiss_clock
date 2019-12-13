import 'dart:math';

import 'package:flutter/material.dart';

class MinuteHand extends StatelessWidget {
  final int currentMinute;
  final double handSize;

  MinuteHand({@required this.currentMinute, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: handSize * 0.48,
      child: Center(
        child: Transform.rotate(
          origin: Offset(0, -8),
          alignment: Alignment.bottomCenter,
          angle: currentMinute * pi / 30,
          child: Container(
            height: handSize,
            child: Image.asset(
              'assets/png/minutes_hand.png',
              height: handSize,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
