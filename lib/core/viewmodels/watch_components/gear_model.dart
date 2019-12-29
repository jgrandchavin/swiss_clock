import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';
import 'package:swiss_clock/ui/watch_components/gear.dart';

class GearModel extends BaseViewModel {
  AnimationController animationController;

  String gearAsset;

  GearModel(
      {@required BuildContext context,
      @required TickerProvider tickerProvider,
      @required GearType gearType})
      : super(context: context) {
    _initAnimation(tickerProvider: tickerProvider);
    _initGearAsset(gearType: gearType);
  }

  /// Init animation
  void _initAnimation({@required TickerProvider tickerProvider}) {
    animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: tickerProvider);
    animationController.repeat();
  }

  /// Get gear assets in function of [gearType]
  void _initGearAsset({@required GearType gearType}) {
    switch (gearType) {
      case GearType.gold:
        gearAsset = 'assets/png/gold_gear.png';
        break;
      case GearType.silver:
        gearAsset = 'assets/png/silver_gear.png';
        break;
      case GearType.silver2:
        gearAsset = 'assets/png/gear2.png';
        break;
      case GearType.silver3:
        gearAsset = 'assets/png/gear3.png';
        break;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
