import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/screens/watch_screen_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';
import 'package:swiss_clock/ui/watch_components/hour_hand.dart';
import 'package:swiss_clock/ui/watch_components/minute_hand.dart';
import 'package:swiss_clock/ui/watch_components/second_hand.dart';

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WatchScreenModel>(
      model: WatchScreenModel(context: context),
      builder: (WatchScreenModel model) {
        return Scaffold(
          backgroundColor: Colors.black45,
          body: Container(
            child: StreamBuilder<DateTime>(
              stream: model.timeProvider.outDateTime,
              initialData: model.timeProvider.currentDateTime,
              builder: (_, dateTimeSnapshot) {
                return Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(child: Image.asset('assets/png/watch.png')),
                    Positioned(
                      top: 80,
                      child: Center(
                        child: Transform.rotate(
                            alignment: Alignment.bottomCenter,
                            angle: dateTimeSnapshot.data.minute * pi / 30,
                            child: MinuteHand()),
                      ),
                    ),
                    Positioned(
                      top: 115,
                      child: Center(
                        child: Transform.rotate(
                            alignment: Alignment.bottomCenter,
                            angle: dateTimeSnapshot.data.hour * pi / 6,
                            child: HourHand()),
                      ),
                    ),
                    Positioned(
                      top: 82,
                      child: Center(
                        child: Transform.rotate(
                            alignment: Alignment.bottomCenter,
                            angle: dateTimeSnapshot.data.second * pi / 30,
                            origin: Offset(0, -25),
                            child: SecondHand()),
                      ),
                    ),
                  ],
                ));
              },
            ),
          ),
        );
      },
    );
  }
}
