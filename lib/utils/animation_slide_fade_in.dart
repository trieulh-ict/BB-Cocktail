import 'package:flutter/material.dart';

class SlideFadeInTransition extends StatelessWidget {
  final Widget _child;
  final AnimationController _controller;
  final SlideFadeInDirection _direction;

  const SlideFadeInTransition(
      {Key key, @required Widget child, @required AnimationController controller, SlideFadeInDirection direction = SlideFadeInDirection.fromLeft})
      : this._child = child,
        this._controller = controller,
        this._direction = direction == null ? SlideFadeInDirection.fromLeft : direction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _controller.drive(Tween<Offset>(begin: Offset(_direction == SlideFadeInDirection.fromLeft ? -0.5 : 0.5, 0.0), end: Offset(0.0, 0.0))),
      child: FadeTransition(
        opacity: _controller.drive(Tween(begin: 0.0, end: 1.0)),
        child: _child,
      ),
    );
  }
}

enum SlideFadeInDirection { fromRight, fromLeft }
