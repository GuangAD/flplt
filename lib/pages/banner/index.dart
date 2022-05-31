import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner'),
      ),
      body: Center(
        child: MyBanner(
          color: Colors.yellow,
          message: 'X',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue[400],
          ),
        ),
      ),
      // body: Center(
      //   child: ClipRect(
      //     child: Banner(
      //       message: 'ttt',
      //       color: Colors.red,
      //       location: BannerLocation.topEnd,
      //       child: Container(
      //         width: 200,
      //         height: 200,
      //         color: Colors.blue[400],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class MyBanner extends StatelessWidget {
  final Widget child;
  final String message;
  final Color color;
  final TextStyle? textStyle;
  const MyBanner({
    Key? key,
    required this.child,
    required this.message,
    required this.color,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = DefaultTextStyle.of(context).style.merge(textStyle);
    final _span = TextSpan(text: message, style: _style);
    final _tp = TextPainter(
      text: _span,
      textDirection: TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    )..layout();
    final _width = max<double>(_tp.width * 2, 50);
    final _height = _tp.height;
    return ClipRect(
      child: Stack(
        children: [
          child,
          Positioned(
            right: 0,
            top: sqrt(_width * _width / 2 -
                sqrt2 * _width * _height +
                _height * _height),
            child: Transform.rotate(
              alignment: Alignment.bottomRight,
              angle: pi / 4,
              child: Container(
                color: color,
                width: _width,
                height: _height,
                child: Center(child: Text.rich(_span)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
