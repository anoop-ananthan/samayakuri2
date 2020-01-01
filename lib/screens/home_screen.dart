import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: TransportAnimation(
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class TransportAnimation extends StatelessWidget {
  TransportAnimation({Key key, this.fit}) : super(key: key);
  final BoxFit fit;
  static const _animationName = 'driving';

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/flare/matt.flr',
      alignment: Alignment.center,
      fit: fit ?? BoxFit.scaleDown,
      animation: _animationName,
    );
  }
}
