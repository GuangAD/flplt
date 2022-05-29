import 'package:flutter/material.dart';

class Orientations extends StatelessWidget {
  const Orientations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientations'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Flex(
              direction: orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Theme.of(context).primaryColor,
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
