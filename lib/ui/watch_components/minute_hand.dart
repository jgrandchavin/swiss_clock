import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiss_clock/core/viewmodels/screens/watch_screen_model.dart';

class MinuteHand extends StatelessWidget {
  final double currentMinute;
  final double handSize;

  MinuteHand({@required this.currentMinute, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Provider.of<WatchScreenModel>(context).screenHeight * 0.163,
      child: Center(
        child: Transform.rotate(
          origin: Offset(0, -Provider.of<WatchScreenModel>(context).screenHeight * 0.018),
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
