import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/screens/splash_screen_view_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashScreenViewModel>(
      model: SplashScreenViewModel(context: context),
      builder: (SplashScreenViewModel model) {
        return Scaffold();
      },
    );
  }
}
