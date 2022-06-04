import 'dart:math';
import 'package:flutter/material.dart';

class HollowPage extends StatelessWidget {
  const HollowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hollow Text'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HollowText1(
              color: Colors.red,
              child: Text(
                'something',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            HollowText2(
              color: Colors.red,
              child: Text(
                'something',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            HollowText3(
              color: Colors.red,
              child: Text(
                '你好',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HollowText1 extends StatelessWidget {
  final Text child;
  final Color color;
  final double strokeWidth;
  const HollowText1({
    Key? key,
    required this.child,
    required this.color,
    this.strokeWidth = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = child.style ?? DefaultTextStyle.of(context).style;
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        Text(
          child.data!,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeCap = StrokeCap.round
              ..strokeJoin = StrokeJoin.round
              ..strokeWidth = strokeWidth
              ..color = color,
            color: null,
          ),
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
          textWidthBasis: child.textWidthBasis,
        ),
        child,
      ],
    );
  }
}

class HollowText2 extends StatelessWidget {
  final Text child;
  final Color color;
  final double strokeWidth;
  const HollowText2({
    Key? key,
    required this.child,
    required this.color,
    this.strokeWidth = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = child.style ?? DefaultTextStyle.of(context).style;
    return Text(
      child.data!,
      style: style.copyWith(
        shadows: List.generate(
          8,
          (index) => Shadow(
              color: color,
              offset: Offset.fromDirection(pi / 4 * index, strokeWidth),
              blurRadius: strokeWidth),
        ),
      ),
      maxLines: child.maxLines,
      overflow: child.overflow,
      semanticsLabel: child.semanticsLabel,
      softWrap: child.softWrap,
      strutStyle: child.strutStyle,
      textAlign: child.textAlign,
      textDirection: child.textDirection,
      textScaleFactor: child.textScaleFactor,
      textWidthBasis: child.textWidthBasis,
    );
  }
}

class HollowText3 extends StatelessWidget {
  final Text child;
  final Color color;
  final double strokeWidth;
  const HollowText3({
    Key? key,
    required this.child,
    required this.color,
    this.strokeWidth = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = child.style ?? DefaultTextStyle.of(context).style;
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        Text(
          child.data!,
          style: style.copyWith(
            fontWeight: FontWeight.w900,
            color: color,
          ),
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
          textWidthBasis: child.textWidthBasis,
        ),
        Text(
          child.data!,
          style: style.copyWith(
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
          textWidthBasis: child.textWidthBasis,
        ),
      ],
    );
  }
}
