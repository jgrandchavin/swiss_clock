import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:swiss_clock/core/providers/base_provider.dart';

class TimeProvider extends BaseProvider {
  Timer timer;

  // User subject
  BehaviorSubject<DateTime> _dateTimeSubject =
      BehaviorSubject<DateTime>.seeded(DateTime.now());
  Function(DateTime) get _inDateTime => _dateTimeSubject.sink.add;
  Observable<DateTime> get outDateTime => _dateTimeSubject.stream;
  DateTime get currentDateTime => _dateTimeSubject.value;

  TimeProvider() {
    _updateTime();
  }

  void _updateTime() {
    if (!_dateTimeSubject.isClosed) _inDateTime(DateTime.now());
    timer = Timer(
        Duration(milliseconds: 250) -
            Duration(microseconds: DateTime.now().microsecond),
        () => _updateTime());
  }

  @override
  void dispose() {
    _dateTimeSubject.close();
    timer.cancel();
    super.dispose();
  }
}
