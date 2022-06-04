import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('收藏'),
              icon: const Icon(Icons.favorite),
              // style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.resolveWith(
              //         (states) => Colors.transparent),
              //     shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
              //         const StadiumBorder()),
              //     side: ButtonStyleButton.allOrNull<BorderSide>(
              //         const BorderSide(width: 2, color: Colors.blueAccent))),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.blueAccent),
                shape: const StadiumBorder(),
                backgroundColor: Colors.transparent,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('收藏'),
              icon: const Icon(Icons.favorite),
              style: TextButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.blueAccent),
                shape: const StadiumBorder(),
                backgroundColor: Colors.transparent,
              ),
            ),
            RawChip(
              avatar: const Icon(Icons.favorite),
              label: const Text('收藏'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
