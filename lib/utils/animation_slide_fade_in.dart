import 'package:flutter/material.dart';

class SlideFadeInTransition extends StatelessWidget {
  const SlideFadeInTransition(
      {@required Widget child,
      @required AnimationController controller,
      Key key,
      SlideFadeInDirection direction = SlideFadeInDirection.fromLeft})
      : _child = child,
        _controller = controller,
        _direction = direction ?? SlideFadeInDirection.fromLeft,
        super(key: key);

  final Widget _child;
  final AnimationController _controller;
  final SlideFadeInDirection _direction;

  @override
  Widget build(BuildContext context) => SlideTransition(
      position: _controller.drive(Tween<Offset>(
          begin: Offset(
              _direction == SlideFadeInDirection.fromLeft ? -0.5 : 0.5, 0),
          end: const Offset(0, 0))),
      child: FadeTransition(
        opacity: _controller.drive(Tween(begin: 0, end: 1)),
        child: _child,
      ),
    );
}

enum SlideFadeInDirection { fromRight, fromLeft }
