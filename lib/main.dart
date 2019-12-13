import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swiss_clock/core/providers/time_provider.dart';
import 'package:swiss_clock/ui/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);

    return Provider<TimeProvider>(
        create: (_) => TimeProvider(),
        dispose: (_, provider) => provider.dispose(),
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Color(0xff202020)),
          title: 'Swiss Clock',
          home: SplashScreen(),
        ));
  }
}
