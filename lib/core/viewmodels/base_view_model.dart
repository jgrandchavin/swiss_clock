import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiss_clock/core/providers/time_provider.dart';

class BaseViewModel extends ChangeNotifier {
  final BuildContext context;
  TimeProvider timeProvider;

  BaseViewModel({@required this.context}) {
    timeProvider = Provider.of<TimeProvider>(context);
  }
}
