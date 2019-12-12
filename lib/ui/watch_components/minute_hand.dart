import 'package:flutter/material.dart';

class MinuteHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 5),
      child: Container(
        height: 120,
        child: Image.asset(
          'assets/png/minutes_hand.png',
          height: 120,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
