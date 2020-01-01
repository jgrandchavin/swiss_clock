import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/watch_components/tourbillon_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';

class Balancer extends StatefulWidget {
  final double watchSize;

  Balancer({@required this.watchSize});

  @override
  _BalancerState createState() => _BalancerState();
}

class _BalancerState extends State<Balancer> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BalancerModel>(
      model: BalancerModel(context: context, tickerProvider: this),
      builder: (BalancerModel model) {
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 0.9).animate(model.animationController),
          child: Container(
              height: widget.watchSize * 0.2,
              width: widget.watchSize * 0.2,
              child: Image.asset('assets/png/balancier.png')),
        );
      },
    );
  }
}
