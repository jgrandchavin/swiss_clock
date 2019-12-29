import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swiss_clock/core/viewmodels/screens/watch_screen_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';
import 'package:swiss_clock/ui/watch_components/balancer.dart';
import 'package:swiss_clock/ui/watch_components/gear.dart';
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
          body: Center(
            child: Container(
              height: model.watchSize,
              width: model.watchSize,
              child: StreamBuilder<DateTime>(
                stream: model.timeProvider.outDateTime,
                initialData: model.timeProvider.currentDateTime,
                builder: (_, dateTimeSnapshot) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned.fill(
                          child: Image.asset(
                        'assets/png/watch.png',
                        height: model.watchSize,
                      )),
                      Positioned(
                          top: model.watchSize * 0.19,
                          bottom: model.watchSize * 0.19,
                          child: SvgPicture.asset('assets/svg/skelet_base.svg')),
                      Positioned(
                          top: model.watchSize * 0.273,
                          left: model.watchSize * 0.29,
                          child: Gear(
                            size: model.watchSize * 0.1,
                            gearType: GearType.silver,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.352,
                          left: model.watchSize * 0.299,
                          child: Gear(
                            size: model.watchSize * 0.08,
                            gearType: GearType.silver,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.465,
                          left: model.watchSize * 0.388,
                          child: Gear(
                            size: model.watchSize * 0.08,
                            gearType: GearType.silver,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.23,
                          left: model.watchSize * 0.375,
                          child: Gear(
                            size: model.watchSize * 0.08,
                            gearType: GearType.silver,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.238,
                          left: model.watchSize * 0.319,
                          child: Gear(
                            size: model.watchSize * 0.087,
                            gearType: GearType.gold,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.333,
                          left: model.watchSize * 0.355,
                          child: Gear(
                            size: model.watchSize * 0.087,
                            gearType: GearType.gold,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.365,
                          left: model.watchSize * 0.435,
                          child: Gear(
                            size: model.watchSize * 0.087,
                            gearType: GearType.gold,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.5,
                          left: model.watchSize * 0.383,
                          child: Gear(
                            size: model.watchSize * 0.17,
                            gearType: GearType.gold,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.41,
                          left: model.watchSize * 0.445,
                          child: Gear(
                            size: model.watchSize * 0.20,
                            gearType: GearType.gold,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.4,
                          left: model.watchSize * 0.432,
                          child: Gear(
                            size: model.watchSize * 0.22,
                            gearType: GearType.silver2,
                            rotationSpeed: 1,
                          )),
                      Positioned(
                          top: model.watchSize * 0.41,
                          left: model.watchSize * 0.43,
                          child: Gear(
                            size: model.watchSize * 0.13,
                            gearType: GearType.silver3,
                            rotationSpeed: 1,
                            reverse: true,
                          )),
                      Positioned(
                          top: model.watchSize * 0.19,
                          bottom: model.watchSize * 0.19,
                          child: SvgPicture.asset('assets/svg/skelet.svg')),
                      Positioned(
                        top: model.watchSize * 0.49,
                        left: model.watchSize * 0.245,
                        child: Balancer(
                          watchSize: model.watchSize,
                        ),
                      ),
                      Positioned(
                          top: model.watchSize * 0.19,
                          bottom: model.watchSize * 0.19,
                          child: SvgPicture.asset('assets/svg/piece1.svg')),
                      HourHand(
                        handSize: model.hourHandSize,
                        currentHour:
                            (dateTimeSnapshot.data.minute / 60) + dateTimeSnapshot.data.hour,
                      ),
                      MinuteHand(
                        handSize: model.minutesHandSize,
                        currentMinute:
                            (dateTimeSnapshot.data.second / 60) + dateTimeSnapshot.data.minute,
                      ),
                      SecondHand(
                        currentSecond: (dateTimeSnapshot.data.millisecond / 1000) +
                            dateTimeSnapshot.data.second,
                        handSize: model.secondsHandSize,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
