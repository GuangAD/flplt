import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterMarkPage extends StatefulWidget {
  const WaterMarkPage({Key? key}) : super(key: key);

  @override
  State<WaterMarkPage> createState() => _WaterMarkPageState();
}

class _WaterMarkPageState extends State<WaterMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Mark'),
      ),
      body: Center(
        child: WaterMark(
          waterMark: 'flutter',
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 200,
            height: 200,
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class WaterMark extends StatelessWidget {
  final Widget child;
  final String? waterMark;
  const WaterMark({
    Key? key,
    required this.child,
    this.waterMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (waterMark == null) {
      return child;
    }
    return Stack(
      children: [
        CupertinoPopupSurface(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: child,
            ),
          ),
        ),
        if (waterMark != null)
          Positioned.fill(
            child: LayoutBuilder(builder: (context, conts) {
              return AspectRatio(
                aspectRatio: 1,
                child: Transform.rotate(
                  angle: -atan(conts.maxHeight / conts.maxWidth),
                  child: FittedBox(child: Text(waterMark!)),
                ),
              );
            }),
          ),
      ],
    );
  }
}
