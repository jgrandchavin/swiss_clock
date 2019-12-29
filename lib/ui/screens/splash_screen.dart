import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/screens/splash_screen_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashScreenViewModel>(
      model: SplashScreenViewModel(context: context),
      builder: (SplashScreenViewModel model) {
        return Scaffold(
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Swiss Watch',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
                ),
                Text(
                  'by Julien Grand-Chavin',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
