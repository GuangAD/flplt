import 'package:flutter/material.dart';
import 'wang_shu.dart';

import 'answers/alex_grid.dart';
import 'answers/alex_list.dart';
import 'answers/bi_luo.dart';
import 'answers/geng_yu.dart';
import 'answers/meng_ning.dart';
import 'answers/ming_zi.dart';
import 'answers/qmr777.dart';
import 'answers/shirne.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);
  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    final demos = {
      "shirne": const Shirne(),
      "彼洛洛洛": const BiLuoDemo(),
      "更与何人说": const GengYuDemo(),
      "qmr777": const Qmr777App(),
      "名字难想好": const MingZiDemo(),
      "AlexV525 - Grid思路": const AlexGrid(),
      "檬柠木子": const MengNingDemo(),
      "AlexV525 - List思路": const AlexList(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("FCD 010"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("UP主："),
            ElevatedButton(
              child: const Text("王叔的Demo"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const WangShuDemo()),
              ),
            ),
            const SizedBox(height: 24),
            const Text("以下是大家的回复，按时间排序："),
            ...demos.keys.map(
              (key) => ElevatedButton(
                child: Text(key),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => demos[key]!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
