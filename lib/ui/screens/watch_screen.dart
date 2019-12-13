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
          body: Container(
            child: StreamBuilder<DateTime>(
              stream: model.timeProvider.outDateTime,
              initialData: model.timeProvider.currentDateTime,
              builder: (_, dateTimeSnapshot) {
                return Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.asset(
                      'assets/png/watch.png',
                      height: model.watchSize,
                    )),
                    HourHand(
                      handSize: model.hourHandSize,
                      currentHour: dateTimeSnapshot.data.hour,
                    ),
                    MinuteHand(
                      handSize: model.minutesHandSize,
                      currentMinute: dateTimeSnapshot.data.minute,
                    ),
                    SecondHand(
                      currentSecond:
                          (dateTimeSnapshot.data.millisecond / 1000) + dateTimeSnapshot.data.second,
                      handSize: model.secondsHandSize,
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
