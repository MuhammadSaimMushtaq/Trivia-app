import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Gamepageprovider extends ChangeNotifier {
  //
  BuildContext context;
  final Dio dio = Dio();
  List? questions;
  int currentQuestion = 0;
  int score = 0;
  String difficulty = 'easy';

  Gamepageprovider({
    required this.context,
    required this.difficulty,
  }) {
    dio.options.baseUrl = 'https://opentdb.com/api.php';
    getQuestions(difficulty);
  }

  Future<void> getQuestions(level) async {
    var response = await dio.get('', queryParameters: {
      'amount': 10,
      'difficulty': level,
      'type': 'boolean',
    });
    var data = jsonDecode(response.toString());
    questions = data['results'];
    notifyListeners();
  }

  String getQuestion() {
    return questions![currentQuestion]['question'];
  }

  Future<void> checkAnswer(String selectedAnswer) async {
    String answer = selectedAnswer;
    bool isCorrect = getAnswer() == answer;
    isCorrect ? score++ : score;
    currentQuestion++;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct!' : 'Incorrect!'),
          content: Text(
              isCorrect ? 'You got it right!' : 'Sorry, that\'s not correct.'),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    if (currentQuestion == 9) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  String getAnswer() {
    return questions![currentQuestion]['correct_answer'].toString();
  }

  Future endGame() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over!'),
          content: Text('Your score is $score/10 in $difficulty mode.'),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
