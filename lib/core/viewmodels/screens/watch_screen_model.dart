import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';

class WatchScreenModel extends BaseViewModel {
  double screenHeight;
  double screenWidth;
  double secondsHandSize;
  double minutesHandSize;
  double hourHandSize;

  WatchScreenModel({@required BuildContext context}) : super(context: context) {
    _initWatchSize();
  }

  /// Init watch and components size
  void _initWatchSize() {
    if (MediaQuery.of(context).size.width / (5 / 3) >
        MediaQuery.of(context).size.height) {
      screenHeight = MediaQuery.of(context).size.height - 32;
      screenWidth = screenHeight * (5 / 3);
    } else {
      screenHeight = (MediaQuery.of(context).size.width - 32) / (5 / 3);
      screenWidth = MediaQuery.of(context).size.width - 32;
    }

    secondsHandSize = screenHeight * 0.44;
    minutesHandSize = screenHeight * 0.35;
    hourHandSize = screenHeight * 0.22;
  }
}
