import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiss_clock/core/utils/page_transition_utils.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';
import 'package:swiss_clock/ui/screens/watch_screen.dart';

class SplashScreenViewModel extends BaseViewModel {
  SplashScreenViewModel({@required BuildContext context}) : super(context: context) {
    _redirection();
  }

  void _redirection() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(PageTransitionUtils.fadePageTransition(page: WatchScreen()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
