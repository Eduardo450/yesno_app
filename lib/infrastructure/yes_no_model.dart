import 'package:yesno_app/domain/entities/message.dart';
import 'dart:math';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image
    });

  //Sirve para crear una nueva instancia de mi clase
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json['answer'],
    forced: json['forced'],
    image: json['image'],
    );

  Message toMessageEntity() => Message(
  text: answer == 'yes'
      ? _randomYes()
      : answer == 'no'
        ? _randomNo()
        : _randomAlternative(),
    fromWho: FromWho.hers,
    imageUrl: image,
    sentAt: DateTime.now(),
  );

  String _randomYes() {
    final afirmativas = [
      '¡Por supuesto!',
      'Sí, claro.',
      'Definitivamente sí.',
      'Sin duda.',
      'Simona',
      'Correcto.'
    ];
    return afirmativas[Random().nextInt(afirmativas.length)];
  }

  String _randomNo() {
    final negativas = [
      'No lo creo.',
      'Definitivamente no.',
      'Para nada.',
      'No es posible.',
      'Nel',
      'Negativo.'
    ];
    return negativas[Random().nextInt(negativas.length)];
  }

  String _randomAlternative() {
    final alternativas = [
      'Tal vez',
      'Quizá',
      'Podría ser',
      'No estoy seguro',
      'Probablemente',
      'No lo sé'
    ];
    return alternativas[Random().nextInt(alternativas.length)];
  }
}