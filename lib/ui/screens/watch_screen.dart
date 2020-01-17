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
              height: model.screenHeight,
              width: model.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 10, spreadRadius: 1)]),
              child: Center(
                child: Container(
                  height: model.screenHeight,
                  width: model.screenHeight,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      StreamBuilder<DateTime>(
                        stream: model.timeProvider.outDateTime,
                        initialData: model.timeProvider.currentDateTime,
                        builder: (_, dateTimeSnapshot) {
                          return Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: <Widget>[
                              Positioned.fill(
                                  child: Image.asset(
                                'assets/png/watch.png',
                                height: model.screenHeight,
                              )),
                              Positioned(
                                  top: model.screenHeight * 0.18,
                                  bottom: model.screenHeight * 0.18,
                                  child: Container(
                                      height: model.screenHeight * 0.56,
                                      child: SvgPicture.asset('assets/svg/skelet_base.svg'))),
                              Positioned(
                                  top: model.screenHeight * 0.284,
                                  left: model.screenHeight * 0.274,
                                  child: Gear(
                                    size: model.screenHeight * 0.1,
                                    gearType: GearType.silver,
                                    reverse: true,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.363,
                                  left: model.screenHeight * 0.281,
                                  child: Gear(
                                    size: model.screenHeight * 0.08,
                                    gearType: GearType.silver,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.494,
                                  left: model.screenHeight * 0.383,
                                  child: Gear(
                                    size: model.screenHeight * 0.08,
                                    gearType: GearType.silver,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.23,
                                  left: model.screenHeight * 0.365,
                                  child: Gear(
                                    size: model.screenHeight * 0.08,
                                    gearType: GearType.silver,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.24,
                                  left: model.screenHeight * 0.301,
                                  child: Gear(
                                    size: model.screenHeight * 0.087,
                                    gearType: GearType.gold,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.345,
                                  left: model.screenHeight * 0.342,
                                  child: Gear(
                                    size: model.screenHeight * 0.087,
                                    gearType: GearType.gold,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.38,
                                  left: model.screenHeight * 0.435,
                                  child: Gear(
                                    size: model.screenHeight * 0.087,
                                    gearType: GearType.gold,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.54,
                                  left: model.screenHeight * 0.378,
                                  child: Gear(
                                    size: model.screenHeight * 0.17,
                                    gearType: GearType.gold,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.45,
                                  left: model.screenHeight * 0.44,
                                  child: Gear(
                                    size: model.screenHeight * 0.20,
                                    gearType: GearType.gold,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.43,
                                  left: model.screenHeight * 0.427,
                                  child: Gear(
                                    size: model.screenHeight * 0.22,
                                    gearType: GearType.silver2,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.43,
                                  left: model.screenHeight * 0.425,
                                  child: Gear(
                                    size: model.screenHeight * 0.13,
                                    gearType: GearType.silver3,
                                    reverse: true,
                                  )),
                              Positioned(
                                  top: model.screenHeight * 0.18,
                                  bottom: model.screenHeight * 0.18,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                      height: model.screenHeight * 0.56,
                                      child: SvgPicture.asset('assets/svg/skelet.svg'))),
                              Positioned(
                                top: model.screenHeight * 0.52,
                                left: model.screenHeight * 0.225,
                                child: Balancer(
                                  watchSize: model.screenHeight,
                                ),
                              ),
                              Positioned(
                                  top: model.screenHeight * 0.18,
                                  bottom: model.screenHeight * 0.18,
                                  child: SvgPicture.asset('assets/svg/piece1.svg')),
                              HourHand(
                                handSize: model.hourHandSize,
                                currentHour: (dateTimeSnapshot.data.minute / 60) + dateTimeSnapshot.data.hour,
                              ),
                              MinuteHand(
                                handSize: model.minutesHandSize,
                                currentMinute: (dateTimeSnapshot.data.second / 60) + dateTimeSnapshot.data.minute,
                              ),
                              SecondHand(
                                currentSecond:
                                    (dateTimeSnapshot.data.millisecond / 1000) + dateTimeSnapshot.data.second,
                                handSize: model.secondsHandSize,
                              ),
                            ],
                          );
                        },
                      ),
                      Positioned(
                        top: model.screenHeight * 0.5 - model.screenHeight * 0.13 / 2,
                        right: model.screenHeight * -0.034,
                        child:
                            Container(height: model.screenHeight * 0.13, child: Image.asset('assets/png/piece3.png')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
