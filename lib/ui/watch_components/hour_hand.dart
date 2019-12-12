import 'package:flutter/material.dart';

class HourHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 5),
      child: Container(
        height: 80,
        child: Image.asset(
          'assets/png/hours_hand.png',
          height: 80,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
