import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

//sendMessage

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: "Hola w", fromWho: FromWho.hers),
    Message(text: "Hoy toca Rondalla", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensake a la lista
    messageList.add(newMessage);

    //Notifica a provider que algo cambió
    notifyListeners();
  }
}