import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:yesno_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://th.bing.com/th/id/R.9331690336a79653e6fdcf64404505ef?rik=yUvV0vPwBkPluw&riu=http%3a%2f%2fimages5.fanpop.com%2fimage%2fphotos%2f30900000%2fterminator-terminator-30973001-1280-1024.jpg&ehk=Th4RunWefbBDMTK%2f75XmPLOHfs4987We%2bGMLxDivLkM%3d&risl=&pid=ImgRaw&r=0"),
          ),
        ),
        title: Text("Terminator"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Le pide que esté pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                  ? HerMessageBubble()
                  : MyMessageBubble();
                },
              )
            ),
            
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}