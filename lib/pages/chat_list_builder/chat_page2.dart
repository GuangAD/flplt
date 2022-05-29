import 'package:flplt/pages/chat_list_builder/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_list_builder/flutter_chat_list_builder.dart';

class ChatPage2 extends StatelessWidget {
  const ChatPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatListController<Message> controller = ChatListController<Message>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Page2"),
      ),
      body: ChatListBuilder<Message>.initMsg(
        intMeaasge: List.generate(20, (index) => Message(index)),
        loadHistory: () async {
          return Future.delayed(const Duration(seconds: 2), () {
            return LoadHistoryResponse(
              isHasMore: true,
              data: List.generate(30, (index) => Message(index)),
            );
          });
        },
        itemBuilder: (_, element) {
          if (element.isMeSend) {
            return Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(element.text),
                )
              ],
            );
          } else {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(element.text),
                )
              ],
            );
          }
        },
        controller: controller,
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            controller.addNewMessage(Message(999));
          },
          child: const Text('New Message'),
        ),
      ],
    );
  }
}
