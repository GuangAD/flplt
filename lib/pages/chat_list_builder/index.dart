import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'chat_page2.dart';

class ChatListBuilder extends StatelessWidget {
  const ChatListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const ChatPage();
                  }));
                },
                child: const Text('TO CHAT'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const ChatPage2();
                  }));
                },
                child: const Text('TO CHAT2'),
              ),
            ],
          ),
        ));
  }
}
