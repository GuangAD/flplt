import 'package:flutter/material.dart';

class AnimatedCrossFadeStep extends StatefulWidget {
  const AnimatedCrossFadeStep({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeStep> createState() => _AnimatedCrossFadeStepState();
}

class _AnimatedCrossFadeStepState extends State<AnimatedCrossFadeStep> {
  final String _img1 =
      'https://tenfei01.cfp.cn/creative/vcg/800/new/VCG211221493052.jpg';
  final String _img2 =
      'https://alifei03.cfp.cn/creative/vcg/800/new/VCG211221492982.jpg';

  bool _isShowFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.network(
            _img1,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          secondChild: Image.network(
            _img2,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          // firstCurve: Curves.easeOutExpo,
          // secondCurve: Curves.easeInBack,
          // firstCurve: const Interval(0, 0.5),
          // secondCurve: const Interval(0.5, 1),
          firstCurve: LinerHalfCurve(),
          secondCurve: LinerHalfCurve().flipped,
          crossFadeState: _isShowFirst
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500),
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.swipe),
        onPressed: () {
          setState(() {
            _isShowFirst = !_isShowFirst;
          });
        },
      ),
    );
  }
}

class LinerHalfCurve extends Curve {
  @override
  double transform(double t) {
    return t < 0.5 ? 2 * t : 1;
  }
}
