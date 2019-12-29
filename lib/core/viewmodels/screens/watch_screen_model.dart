import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';

class WatchScreenModel extends BaseViewModel {
  double watchSize;
  double secondsHandSize;
  double minutesHandSize;
  double hourHandSize;

  WatchScreenModel({@required BuildContext context}) : super(context: context) {
    _initWatchSize();
  }

  /// Init watch and components size
  void _initWatchSize() {
    watchSize = MediaQuery.of(context).size.height + MediaQuery.of(context).padding.vertical;
    secondsHandSize = watchSize * 0.42;
    minutesHandSize = watchSize * 0.33;
    hourHandSize = watchSize * 0.20;
  }
}
