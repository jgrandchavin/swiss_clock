import 'dart:math';

import 'package:flutter/material.dart';

class SecondHand extends StatelessWidget {
  final double currentSecond;
  final double handSize;

  SecondHand({@required this.currentSecond, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: handSize * 0.34,
      child: Center(
        child: Transform.rotate(
            alignment: Alignment.bottomCenter,
            angle: currentSecond * pi / 30,
            origin: Offset(0, -handSize * 0.22),
            child: Container(
              height: handSize,
              child: Image.asset(
                'assets/png/seconds_hand.png',
                height: handSize,
                fit: BoxFit.fitHeight,
              ),
            )),
      ),
    );
  }
}
