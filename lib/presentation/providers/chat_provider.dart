import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: "Hola Mauri", fromWho: FromWho.me),
    Message(text: "Hoy toca Rondalla", fromWho: FromWho.me),
  ];

}