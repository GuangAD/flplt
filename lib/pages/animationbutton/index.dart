import 'package:flutter/material.dart';

class AnimatedButtonPage extends StatefulWidget {
  const AnimatedButtonPage({Key? key}) : super(key: key);

  @override
  State<AnimatedButtonPage> createState() => _AnimatedButtonPageState();
}

class _AnimatedButtonPageState extends State<AnimatedButtonPage> {
  bool _isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedButton'),
      ),
      body: Center(
        child: AnimatedButtonSwitch(
          onPressed: () => setState(() => _isBig = !_isBig),
          big: _isBig,
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}

class AnimatedButtonSwitch extends StatelessWidget {
  final Function() onPressed;
  final Duration duration;
  final bool big;
  const AnimatedButtonSwitch({
    Key? key,
    required this.big,
    required this.onPressed,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      width: big ? 200 : 60,
      height: 60,
      child: Material(
        color: Colors.purple,
        elevation: 10,
        shape: const StadiumBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const StadiumBorder(),
          child: AnimatedSwitcher(
            duration: duration,
            child:
                big ? const Text('Ready?') : const Icon(Icons.arrow_right_alt),
          ),
        ),
      ),
    );
  }
}
