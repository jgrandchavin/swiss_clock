import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';

class BalancerModel extends BaseViewModel {
  AnimationController animationController;

  BalancerModel(
      {@required BuildContext context, @required TickerProvider tickerProvider})
      : super(context: context) {
    _initAnimation(tickerProvider: tickerProvider);
  }

  /// Init animation
  void _initAnimation({@required TickerProvider tickerProvider}) {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: tickerProvider);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
