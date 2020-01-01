import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiss_clock/core/viewmodels/screens/watch_screen_model.dart';

class SecondHand extends StatelessWidget {
  final double currentSecond;
  final double handSize;

  SecondHand({@required this.currentSecond, @required this.handSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Provider.of<WatchScreenModel>(context).screenHeight * 0.15,
      child: Center(
        child: Transform.rotate(
            alignment: Alignment.bottomCenter,
            angle: currentSecond * pi / 30,
            origin: Offset(0,
                -Provider.of<WatchScreenModel>(context).screenHeight * 0.097),
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
