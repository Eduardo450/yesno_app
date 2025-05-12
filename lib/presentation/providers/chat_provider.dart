import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

//sendMessage

class ChatProvider extends ChangeNotifier{

  //Controlador qeue maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: "Hola w", fromWho: FromWho.hers),
    Message(text: "Hoy toca Rondalla", fromWho: FromWho.me),
    Message(text: "Que ondi", fromWho: FromWho.hers),
    Message(text: "Quiero una torta", fromWho: FromWho.me),
    Message(text: "Quiero una de asada", fromWho: FromWho.hers),
    Message(text: "Merry Christmas", fromWho: FromWho.me),
  ];


  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    if(text.trim().isEmpty) return;
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');



    //Notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async{
    //Animación de scrolleo
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset: posición del máximo scroll posible
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      //Rebote al final de la animación
      curve: Curves.easeOut);
  }
}