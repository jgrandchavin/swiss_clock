import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageTransitionUtils {
  /// Slide page transition
  static Route slidePageTransition({@required Widget page}) => PageTransition(
      type: PageTransitionType.rightToLeft, duration: Duration(milliseconds: 200), child: page);

  /// Slide page transition
  static Route fadePageTransition({@required Widget page}) =>
      PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: page);
}
