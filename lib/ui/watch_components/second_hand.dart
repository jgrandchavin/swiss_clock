import 'package:flutter/material.dart';

class SecondHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 5),
      child: Container(
        height: 140,
        child: Image.asset(
          'assets/png/seconds_hand.png',
          height: 140,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
