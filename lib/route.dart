import 'package:flplt/pages/animated_cross_fade_step/animated_cross_fade_step.dart';
import 'package:flplt/pages/animation_button/animation_button.dart';
import 'package:flplt/pages/banner/banner.dart';
import 'package:flplt/pages/button/button.dart';
import 'package:flplt/pages/cut_down_button/cut_down_button.dart';
import 'package:flplt/pages/diagonal/diagonal.dart';
import 'package:flplt/pages/gallery_view/gallery_view.dart';
import 'package:flplt/pages/hollow_text/hollow_text.dart';
import 'package:flplt/pages/orientation/orientation.dart';
import 'package:flplt/pages/spring/spring.dart';
import 'package:flplt/pages/water_mark/water_mark.dart';
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
            ListTile(
              title: const Text('DiagonalPage'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const DiagonalPage();
                }));
              },
            ),
            ListTile(
              title: const Text('AnimatedButtonPage'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AnimatedButtonPage();
                }));
              },
            ),
            ListTile(
              title: const Text('HollowPage'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const HollowPage();
                }));
              },
            ),
            ListTile(
              title: const Text('WaterMark'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const WaterMarkPage();
                }));
              },
            ),
            ListTile(
              title: const Text('cutdown button'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const CutDownButtonPage();
                }));
              },
            ),
            ListTile(
              title: const Text('GalleryView'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const GalleryView();
                }));
              },
            ),
            ListTile(
              title: const Text('Spring'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const Spring();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
