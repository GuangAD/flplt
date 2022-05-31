import 'package:flplt/pages/animated_cross_fade_step/index.dart';
import 'package:flplt/pages/banner/index.dart';
import 'package:flplt/pages/button/index.dart';
import 'package:flplt/pages/orientation/index.dart';
import 'package:flutter/material.dart';
import 'pages/chat_list_builder/index.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('flutter chat list builder'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const ChatListBuilder();
                }));
              },
            ),
            ListTile(
              title: const Text('orientations'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const Orientations();
                }));
              },
            ),
            ListTile(
              title: const Text('animated cross fade step'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AnimatedCrossFadeStep();
                }));
              },
            ),
            ListTile(
              title: const Text('button'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const Button();
                }));
              },
            ),
            ListTile(
              title: const Text('banner'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const BannerPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
