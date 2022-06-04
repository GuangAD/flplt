import 'package:flutter/material.dart';

class DiagonalPage extends StatelessWidget {
  const DiagonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagonal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Diagonal(
          children: [
            const FlutterLogo(size: 100),
            Container(width: 50, height: 150, color: Colors.red),
            const Text('Hello World'),
          ],
        ),
      ),
    );
  }
}

class Diagonal extends StatelessWidget {
  final List<Widget> children;
  const Diagonal({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: DiagnalLayoutDelegate(),
      children: [
        for (int item = 0; item < children.length; item++)
          LayoutId(
            id: item,
            child: children[item],
          ),
      ],
    );
  }
}

class DiagnalLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Offset offset = Offset.zero;
    for (int i = 0;; i++) {
      if (hasChild(i)) {
        final childsize = layoutChild(i, BoxConstraints.loose(size));
        positionChild(i, offset);
        offset = offset + Offset(childsize.width, childsize.height);
      } else {
        break;
      }
    }
  }

  @override
  bool shouldRelayout(oldDelegate) => false;
}
