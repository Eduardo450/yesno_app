import 'package:flutter/material.dart';
import 'package:yesno_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //Variable de la identidad atómica Message
  final Message message;
  const MyMessageBubble({super.key,
  //Se añade la variable al constructor
  required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text,
            style: const TextStyle(color: Colors.white),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.done_all, color: Colors.blue[800]),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Visto a las ${TimeOfDay.fromDateTime(message.sentAt).format(context)}',
              style: const TextStyle(color: Colors.grey),),
          ),
          ],
        ),
        const SizedBox(height: 5,),
      ],
    );
  }
}