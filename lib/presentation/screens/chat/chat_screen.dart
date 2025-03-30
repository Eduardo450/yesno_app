import 'package:flutter/material.dart';
import 'package:yesno_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yesno_app/presentation/Widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.U-72ydzjj2ITqjufHWpNXgAAAA?rs=1&pid=ImgDetMain"),
          ),
        ),
        title: Text("Mi Bebé ♡"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
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