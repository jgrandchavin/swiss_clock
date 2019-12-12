import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/base_view_model.dart';
import 'package:swiss_clock/ui/screens/watch_screen.dart';

class SplashScreenViewModel extends BaseViewModel {
  SplashScreenViewModel({@required BuildContext context}) : super(context: context) {
    _redirection();
  }

  void _redirection() async {
    Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => WatchScreen()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
