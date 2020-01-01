import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiss_clock/core/viewmodels/screens/watch_screen_model.dart';

class HourHand extends StatelessWidget {
  final double currentHour;
  final double handSize;

  HourHand({@required this.currentHour, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Provider.of<WatchScreenModel>(context).screenHeight * 0.295,
        child: Center(
            child: Transform.rotate(
          alignment: Alignment.bottomCenter,
          origin: Offset(
              0, -Provider.of<WatchScreenModel>(context).screenHeight * 0.02),
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
