import 'dart:async';

import 'package:flutter/widgets.dart';

Future main() async {
  runApp(
    new ClipRRect(
      borderRadius: new BorderRadius.circular(12.0),
      child: new Container(
        decoration: new BoxDecoration(
          backgroundImage: new BackgroundImage(
            image: new AssetImage('assets/Nighthawks.jpg'),
            alignment: const FractionalOffset(0.4, 0.5),
            fit: ImageFit.cover,
          ),
        ),
        child: new Slider(
          child: new Opacity(
            opacity: 0.5,
            child: new Container(
              decoration: new BoxDecoration(
                backgroundColor: new Color(0xFFFF0000),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class Slider extends StatefulWidget {
  final Widget child;
  Slider({this.child});
  @override
  SliderState createState() => new SliderState();
}

class SliderState extends State<Slider> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        if (_controller.value == 1.0) {
          _controller.reverse();
        }
        if (_controller.value == 0.0) {
          _controller.forward();
        }
        return new Transform(
          transform: new Matrix4.translationValues(
            _controller.value * 400.0,
            _controller.value * 100.0,
            0.0,
          ),
          child: child,
        );
      },
      child: config.child,
    );
  }
}
