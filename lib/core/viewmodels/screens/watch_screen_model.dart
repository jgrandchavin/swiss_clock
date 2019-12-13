import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';

class WatchScreenModel extends BaseViewModel {
  double watchSize;
  double secondsHandSize;
  double minutesHandSize;
  double hourHandSize;

  WatchScreenModel({@required BuildContext context}) : super(context: context) {
    watchSize = MediaQuery.of(context).size.height;
    secondsHandSize = watchSize * 0.44;
    minutesHandSize = watchSize * 0.35;
    hourHandSize = watchSize * 0.20;
  }
}
