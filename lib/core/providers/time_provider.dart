import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:swiss_clock/core/providers/base_provider.dart';

class TimeProvider extends BaseProvider {
  // User subject
  BehaviorSubject<DateTime> _dateTimeSubject = BehaviorSubject<DateTime>.seeded(DateTime.now());
  Function(DateTime) get _inDateTime => _dateTimeSubject.sink.add;
  Observable<DateTime> get outDateTime => _dateTimeSubject.stream;
  DateTime get currentDateTime => _dateTimeSubject.value;

  TimeProvider() {
    _updateTime();
  }

  void _updateTime() {
    _inDateTime(DateTime.now());
    print(DateTime.now());

    Timer(Duration(milliseconds: 250), () => _updateTime());
  }

  @override
  void dispose() {
    _dateTimeSubject.close();
    super.dispose();
  }
}
