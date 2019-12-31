import 'package:flutter/material.dart';
import 'package:swiss_clock/core/viewmodels/watch_components/gear_model.dart';
import 'package:swiss_clock/ui/shared/view_model_provider.dart';

enum GearType { gold, silver, silver2, silver3 }

class Gear extends StatefulWidget {
  final GearType gearType;
  final double size;
  final bool reverse;

  Gear({@required this.gearType, @required this.size, this.reverse = false});

  @override
  _GearState createState() => _GearState();
}

class _GearState extends State<Gear> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GearModel>(
      model: GearModel(context: context, tickerProvider: this, gearType: widget.gearType),
      builder: (GearModel model) {
        return RotationTransition(
          turns: Tween(begin: widget.reverse ? 1.0 : 0.0, end: widget.reverse ? 0.0 : 1.0)
              .animate(model.animationController),
          child: Container(
            height: widget.size,
            width: widget.size,
            child: Image.asset(model.gearAsset),
          ),
        );
      },
    );
  }
}
