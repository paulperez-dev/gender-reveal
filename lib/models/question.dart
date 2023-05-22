import 'dart:convert';
import 'package:revel_ui/revel_ui.dart';

enum Response { isCorrect, isWrong, notAnswered }

class Test {
  Test({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.pearlGender,
  });
  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: int.tryParse(json['id'].toString()) ?? 0,
        question: json['question'].toString(),
        answers: getAnswers(json['answers'] as Map<String, dynamic>),
        correctAnswer: json['correctAnswer'].toString(),
        pearlGender: json['pearlType'].toString().compareTo('boy') == 0
            ? PearlGender.boy
            : PearlGender.girl,
      );

  factory Test.fromRawJson(String str) =>
      Test.fromJson(json.decode(str) as Map<String, dynamic>);

  final int id;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final PearlGender pearlGender;

  Test copyWith({
    int? id,
    String? question,
    List<String>? answers,
    String? correctAnswer,
    PearlGender? pearlGender,
  }) =>
      Test(
        id: id ?? this.id,
        question: question ?? this.question,
        answers: answers ?? this.answers,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        pearlGender: pearlGender ?? this.pearlGender,
      );
}

List<String> getAnswers(Map<String, dynamic> json) => [
      json['answer1'].toString(),
      json['answer2'].toString(),
      if (json['answer3'] != null) json['answer3'].toString(),
    ];

List<String>? getAnswersFromRawJson(String str) =>
    getAnswers(json.decode(str) as Map<String, dynamic>);

const List<String> rawJsons = [
  '{"id":0,"question":"¿Cómo se llama mi papá?","answers":{"answer1":"Armando","answer2":"Paul","answer3":"Miguel"},"correctAnswer":"Paul","pearlType":"boy"}',
  '{"id":1,"question":"¿Seré el/la hij@ número _ de mis padres?","answers":{"answer1":"2","answer2":"3","answer3":"1"},"correctAnswer":"1","pearlType":"girl"}',
  '{"id":2,"question":"¿Dónde nacieron mis padres?","answers":{"answer1":"Rep.Dom","answer2":"EE.UU","answer3":"Uruguay"},"correctAnswer":"Rep.Dom","pearlType":"girl"}',
  '{"id":3,"question":"¿En cuál mes estiman naceré?","answers":{"answer1":"Enero","answer2":"Junio","answer3":"Mayo"},"correctAnswer":"Mayo","pearlType":"girl"}',
  '{"id":4,"question":"¿Cuánto es 🚺🚹 + 🚼 = ?","answers":{"answer1":"2","answer2":"4","answer3":"3"},"correctAnswer":"3","pearlType":"boy"}',
  '{"id":5,"question":"¿Tengo hermanos?","answers":{"answer1":"Sí","answer2":"No"},"correctAnswer":"No","pearlType":"girl"}',
  '{"id":6,"question":"¿De qué se graduó mi papá?","answers":{"answer1":"Ing. en Software","answer2":"Dr. en Astrología","answer3":"Lic. en Psicología"},"correctAnswer":"Ing. en Software","pearlType":"girl"}',
  '{"id":7,"question":"¿Cómo se llama mi mamá?","answers":{"answer1":"Licelot","answer2":"Nicole","answer3":"Leidy"},"correctAnswer":"Leidy","pearlType":"boy"}',
  '{"id":8,"question":"¿Cuáles son los apellidos de mis padres?","answers":{"answer1":"Cruz-López","answer2":"Pérez-León","answer3":"Vargas-Cabrera"},"correctAnswer":"Pérez-León","pearlType":"boy"}',
];
