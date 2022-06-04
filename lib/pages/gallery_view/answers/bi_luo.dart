/// Author: 彼洛洛洛
/// https://github.com/a479304861/FlutterDemo/blob/main/GalleryViewDemo.dart

import 'package:flutter/material.dart';

class BiLuoDemo extends StatefulWidget {
  const BiLuoDemo({Key? key}) : super(key: key);
  @override
  State<BiLuoDemo> createState() => _BiLuoDemoState();
}

class _BiLuoDemoState extends State<BiLuoDemo> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("彼洛洛洛 Demo"),
      ),
      body: Scrollbar(
        controller: _controller,
        child: GalleryView.builder(
          controller: _controller,
          itemCount: 101,
          minPerRow: 1,
          maxPerRow: 10,
          duration: const Duration(milliseconds: 500),
          itemBuilder: (_, index) => Container(
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text("$index"),
          ),
        ),
      ),
    );
  }
}

class GalleryView extends StatefulWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollController? controller;
  final int itemCount;
  final int minPerRow;
  final int maxPerRow;
  final Duration? duration;

  const GalleryView.builder({
    Key? key,
    required this.itemBuilder,
    this.controller,
    required this.itemCount,
    this.minPerRow = 1,
    this.maxPerRow = 7,
    this.duration,
  }) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  double _scale = 1;
  double _lateScale = 1;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var maxWidth = screenWidth / widget.maxPerRow;
    var minWidth = screenWidth / widget.minPerRow;
    var nowWidth = maxWidth * (_scale);
    var count = screenWidth / nowWidth; //每行多少个
    var countCeil = count.ceil(); //取整
    nowWidth = screenWidth / countCeil;
    if (nowWidth > minWidth) {
      _scale = minWidth / maxWidth;
      nowWidth = minWidth;
    }
    // print('$_tempScale    $nowWidth     $_scale');
    return GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
        setState(() {
          if (scaleUpdateDetails.scale == 1) {
            _lateScale = 1;
          }
          _scale = _scale * (1 + scaleUpdateDetails.scale - _lateScale);
          _lateScale = scaleUpdateDetails.scale;
        });
        if (_scale <= 1) _scale = 1;
      },
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: nowWidth),
          itemCount: widget.itemCount,
          itemBuilder: (ctx, index) {
            return OpacityContainer(
              widget: widget.itemBuilder(ctx, index),
              duration: widget.duration == null
                  ? const Duration(seconds: 1)
                  : widget.duration!,
            );
          }),
    );
  }
}

class OpacityContainer extends StatefulWidget {
  final Widget widget;
  final Duration duration;

  const OpacityContainer(
      {Key? key, required this.widget, required this.duration})
      : super(key: key);

  @override
  State<OpacityContainer> createState() => _OpacityContainerState();
}

class _OpacityContainerState extends State<OpacityContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _controller.value,
      child: widget.widget,
    );
  }
}
