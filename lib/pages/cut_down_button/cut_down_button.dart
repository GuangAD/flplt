import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// SweepGradient();

class CutDownButtonPage extends StatelessWidget {
  const CutDownButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CutDownButton'),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          // child: CutdownButton(
          //   text: 'send',
          //   width: 50,
          //   height: 30,
          // ),
          // child: CountdownButton2(
          //   duration: Duration(seconds: 2),
          //   width: 50,
          //   height: 30,
          // ),
          // child: CountdownButton3(
          //   style: ButtonStyle(
          //     // backgroundColor: MaterialStateProperty.all(Colors.yellowAccent[100]),
          //     shape: MaterialStateProperty.all(StadiumBorder()),
          //     side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          //       if (states.contains(MaterialState.disabled))
          //         return BorderSide(color: Colors.grey, width: 2);
          //       return BorderSide(color: Colors.blue, width: 2);
          //     }),
          //   ),
          //   child: Text("hello world!"),
          //   onCancel: () => print('cancel'),
          //   onEnd: () => print('onEnd'),
          // ),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (rect) {
              return const SweepGradient(
                colors: [Colors.red, Colors.blue],
                // transform: GradientRotation(-1.57),
                stops: [0, 1.5],
              ).createShader(rect);
            },
            child: OutlinedButton(
              // style: widget.style.copyWith(
              //   foregroundColor: MaterialStateProperty.all(Colors.transparent),
              //   backgroundColor: MaterialStateProperty.all(Colors.transparent),
              // ),
              onPressed: () {},
              child: const Text('SweepGradient'),
            ),
          ),
        ),
        separatorBuilder: (_, index) => Container(
          height: 10,
        ),
        itemCount: 3,
      ),
    );
  }
}

class CutdownButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final Duration duration;
  final Color? activeColor;
  final Color? disabledColor;
  final double radius;
  const CutdownButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.activeColor,
    this.disabledColor,
    this.radius = 20,
    this.duration = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  State<CutdownButton> createState() => _CutdownButtonState();
}

enum _CutdownButtonStateStatus {
  active,
  inactive,
  disabled,
}

class _CutdownButtonState extends State<CutdownButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animacontroller =
      AnimationController(vsync: this, duration: widget.duration)
        ..addListener(() {
          if (_animacontroller.status == AnimationStatus.completed) {
            setState(() => _status = _CutdownButtonStateStatus.disabled);
          }
        });
  _CutdownButtonStateStatus _status = _CutdownButtonStateStatus.active;

  late final Color _activeColor =
      widget.activeColor ?? Theme.of(context).primaryColor;
  late final Color _disabledColor = widget.disabledColor ?? Colors.grey;

  @override
  Widget build(BuildContext context) {
    Color textColor = _activeColor;
    Color? backgroundColor;
    switch (_status) {
      case _CutdownButtonStateStatus.active:
        textColor = Colors.white;
        backgroundColor = _activeColor;
        break;
      case _CutdownButtonStateStatus.inactive:
        textColor = _activeColor;
        break;
      case _CutdownButtonStateStatus.disabled:
        textColor = _disabledColor;
        break;
    }
    return Stack(
      children: [
        CustomPaint(
          painter: _CutdownButtonPainter(
            animation: _animacontroller,
            radius: widget.radius,
            activeColor: _activeColor,
            disabledColor: _disabledColor,
            width: widget.width,
            height: widget.height,
          ),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextButton(
            onPressed: () {
              if (_status == _CutdownButtonStateStatus.active) {
                _animacontroller.forward(from: 0);
                setState(() {
                  _status = _CutdownButtonStateStatus.inactive;
                });
              } else {
                _animacontroller.reset();
                setState(() {
                  _status = _CutdownButtonStateStatus.active;
                });
              }
            },
            style: TextButton.styleFrom(
              primary: textColor,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  widget.radius,
                ),
              ),
            ),
            child: Text(widget.text),
          ),
        ),
      ],
    );
  }
}

class _CutdownButtonPainter extends CustomPainter {
  final AnimationController animation;
  final double radius;
  final double width;
  final double height;
  late RRect shape;
  late Paint activePaint;
  late Paint disabledPaint;
  late PathMetric pathMetric;

  _CutdownButtonPainter({
    required this.animation,
    required this.radius,
    required Color activeColor,
    required Color disabledColor,
    required this.width,
    required this.height,
  }) : super(repaint: animation) {
    activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    disabledPaint = Paint()
      ..color = disabledColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    shape = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: width, height: height),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(shape);
    pathMetric = path.computeMetrics().single;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(width / 2, height / 2);
    final path = Path();
    final totallength = pathMetric.length;
    final drawlength = totallength * animation.value;
    // path.addPath(pathMetric.extractPath(0, drawlength), Offset.zero);

    final double startPoint = totallength / 4 - max(height / 2 - radius, 0);

    final drawPath1 =
        pathMetric.extractPath(startPoint, drawlength + startPoint);

    final drawPath2 =
        pathMetric.extractPath(0, drawlength - (totallength - startPoint));
    path.addPath(drawPath1, Offset.zero);
    path.addPath(drawPath2, Offset.zero);
    canvas.drawRRect(shape, activePaint);
    canvas.drawPath(path, disabledPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CountdownButton2 extends StatefulWidget {
  const CountdownButton2({
    Key? key,
    required this.duration,
    this.width,
    this.height,
    this.radius = 0,
    this.borderWidth = 2,
    this.borderColor,
    this.color,
    this.builder,
    this.onStart,
    this.onCancel,
    this.onEnd,
  }) : super(key: key);

  final Duration duration;
  final double? width;
  final double? height;
  final double radius;
  final double borderWidth;
  final Color? borderColor;
  final Color? color;
  final Widget Function(
    BuildContext context,
    bool isStarted,
    bool hasEnded,
  )? builder;
  final VoidCallback? onStart;
  final VoidCallback? onCancel;
  final VoidCallback? onEnd;

  @override
  State<CountdownButton2> createState() => _CountdownButton2State();
}

class _CountdownButton2State extends State<CountdownButton2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..addStatusListener(_listener);

  final ValueNotifier<bool> _isStarted = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hasEnded = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_listener)
      ..dispose();
    super.dispose();
  }

  void _listener(AnimationStatus status) {
    final bool isAnimating =
        status == AnimationStatus.forward || status == AnimationStatus.reverse;
    if (isAnimating && !_isStarted.value) {
      _isStarted.value = true;
      _hasEnded.value = false;
    } else if (!isAnimating && !_hasEnded.value) {
      _isStarted.value = false;
      _hasEnded.value = true;
      widget.onEnd?.call();
    }
  }

  void _onTap() {
    if (_controller.isAnimating) {
      widget.onCancel?.call();
      _controller
        ..stop()
        ..reset();
      _isStarted.value = false;
      _hasEnded.value = false;
    } else {
      widget.onStart?.call();
      _controller
        ..reset()
        ..forward();
    }
  }

  Widget _defaultChildBuilder(
    BuildContext context,
    bool isStarted,
    bool hasEnded,
  ) {
    return Center(
      child: Text(
        isStarted
            ? 'Cancel'
            : hasEnded
                ? 'Done'
                : 'Send',
        style: TextStyle(
          color: isStarted
              ? Theme.of(context).primaryColor
              : hasEnded
                  ? Theme.of(context).textTheme.caption?.color
                  : Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = CustomPaint(
      painter: CountdownButtonPainter(
        controller: _controller,
        radius: widget.radius,
        borderColor: widget.borderColor ?? Colors.grey,
        borderWidth: widget.borderWidth,
        color: widget.color ?? Theme.of(context).primaryColor,
      ),
      size: Size(widget.width ?? 0, widget.height ?? 0),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isStarted,
        builder: (_, bool isStarted, __) => ValueListenableBuilder<bool>(
          valueListenable: _hasEnded,
          builder: (_, bool hasEnded, __) =>
              widget.builder?.call(context, isStarted, hasEnded) ??
              _defaultChildBuilder(context, isStarted, hasEnded),
        ),
      ),
    );
    if (widget.width != null || widget.height != null) {
      child = ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.width ?? double.infinity,
          maxHeight: widget.height ?? double.infinity,
        ),
        child: child,
      );
    }
    child = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: child,
    );
    return child;
  }
}

class CountdownButtonPainter extends CustomPainter {
  CountdownButtonPainter({
    required this.controller,
    required this.borderColor,
    required this.borderWidth,
    required this.color,
    this.radius = 0,
  }) : super(repaint: controller);

  final AnimationController controller;
  final Color borderColor;
  final double borderWidth;
  final Color color;
  final double radius;

  late double effectiveRadius;

  Radius get _circularRadius => Radius.circular(effectiveRadius);

  /// 按需创建内容，并不是每次绘制的时候都需要新的实例。
  Path? _path;
  PathMetric? _metric;

  @override
  void paint(Canvas canvas, Size size) {
    // 圆角值需要在一个合理的范围内，超出二分之一宽或高时，以最小值为准。
    effectiveRadius = min(
      radius,
      min(size.width / 2, size.height / 2),
    );

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    _path ??= _createPath(size);
    _metric ??= _path!.computeMetrics().single;

    canvas.drawPath(_path!, paint);

    // 进度为 0 的时候，直接将 RRect 全部填充，不进行其他操作。
    if (controller.value == 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          _circularRadius,
        ),
        Paint()
          ..style = PaintingStyle.fill
          ..color = color,
      );
      return;
    }

    _drawMetric(canvas, paint, _metric!);
  }

  @override
  bool shouldRepaint(CountdownButtonPainter oldDelegate) {
    final bool shouldRepaint = borderWidth != oldDelegate.borderWidth ||
        borderColor != oldDelegate.borderColor ||
        color != oldDelegate.color ||
        radius != oldDelegate.radius ||
        controller != oldDelegate.controller;
    // 需要重绘的时候，置空实例进行重建。
    if (shouldRepaint) {
      _path = null;
      _metric = null;
    }
    return shouldRepaint;
  }

  Path _createPath(Size size) {
    final double width = size.width;
    final double height = size.height;

    return Path()
      // 移动到二分之一宽度位置，作为起始点。
      ..moveTo(width / 2, 0)
      // 右上直线
      ..relativeLineTo(width / 2 - effectiveRadius, 0)
      // 右上弧
      ..relativeArcToPoint(
        Offset(effectiveRadius, effectiveRadius),
        radius: _circularRadius,
      )
      // 右侧直线
      ..relativeLineTo(0, height - effectiveRadius * 2)
      // 右下弧
      ..relativeArcToPoint(
        Offset(-effectiveRadius, effectiveRadius),
        radius: _circularRadius,
      )
      // 底部直线
      ..relativeLineTo(-width + effectiveRadius * 2, 0)
      // 左下弧
      ..relativeArcToPoint(
        Offset(-effectiveRadius, -effectiveRadius),
        radius: _circularRadius,
      )
      // 左侧直线
      ..relativeLineTo(0, -height + effectiveRadius * 2)
      // 左上弧
      ..relativeArcToPoint(
        Offset(effectiveRadius, -effectiveRadius),
        radius: _circularRadius,
      )
      // 左上直线
      ..relativeLineTo(width / 2 - effectiveRadius, 0)
      ..close();
  }

  void _drawMetric(Canvas canvas, Paint paint, PathMetric metric) {
    canvas.drawPath(
      metric.extractPath(0, metric.length * controller.value),
      paint..color = borderColor,
    );
  }
}

class CountdownButton3 extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onCancel;
  final VoidCallback? onEnd;
  final ButtonStyle style;

  @override
  State<CountdownButton3> createState() => _CountdownButton3State();

  const CountdownButton3({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.onCancel,
    this.onEnd,
    this.style = const ButtonStyle(),
  }) : super(key: key);
}

class _CountdownButton3State extends State<CountdownButton3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _ratio = 0;
  VoidCallback? _onPressed;

  @override
  void initState() {
    super.initState();
    _onPressed = start;
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.addListener(() {
      setState(() => _ratio = _controller.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _ratio == 1) {
        setState(() => _onPressed = null);
        widget.onEnd?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OutlinedButton(
          style: widget.style
              .copyWith(side: MaterialStateProperty.all(BorderSide.none)),
          onPressed: _onPressed,
          child: widget.child,
        ),
        IgnorePointer(
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (rect) {
              return SweepGradient(
                colors: const [Colors.grey, Colors.transparent],
                transform: const GradientRotation(-1.57),
                stops: [_ratio, _ratio],
              ).createShader(rect);
            },
            child: OutlinedButton(
              style: widget.style.copyWith(
                foregroundColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: _onPressed,
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }

  void start() {
    _controller.forward();
    _onPressed = cancel;
  }

  void cancel() {
    widget.onCancel?.call();
    reset();
  }

  void reset() {
    setState(() {
      _ratio = 0;
      _onPressed = start;
      _controller.reset();
    });
  }
}
