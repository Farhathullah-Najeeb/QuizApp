import 'package:flutter/material.dart';

class QuizProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {'text': 'A programming language', 'score': 0},
        {'text': 'A web framework', 'score': 0},
        {'text': 'A mobile UI framework', 'score': 1},
        {'text': 'A game', 'score': 0},
      ],
    },
    {
      'questionText': 'What does the acronym "Dart" stand for?',
      'answers': [
        {'text': 'Digital Art', 'score': 0},
        {'text': 'Dynamic and Rapid Technology', 'score': 0},
        {'text': 'Developed App Runtime', 'score': 0},
        {'text': 'Structured Web Programming Language', 'score': 1},
      ],
    },
    {
      'questionText':
          'Which widget is used to display a list of items in Flutter?',
      'answers': [
        {'text': 'ListView', 'score': 1},
        {'text': 'GridView', 'score': 0},
        {'text': 'Column', 'score': 0},
        {'text': 'Row', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "BuildContext" in Flutter?',
      'answers': [
        {'text': 'To manage state', 'score': 0},
        {'text': 'To build widgets', 'score': 1},
        {'text': 'To handle user input', 'score': 0},
        {'text': 'To define routes', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the main function in a Flutter app?',
      'answers': [
        {'text': 'The entry point of the app', 'score': 1},
        {'text': 'The root widget', 'score': 0},
        {'text': 'The first screen displayed', 'score': 0},
        {'text': 'The app configuration', 'score': 0},
      ],
    },
    {
      'questionText': 'Which widget is used to create a button in Flutter?',
      'answers': [
        {'text': 'TextButton', 'score': 0},
        {'text': 'ElevatedButton', 'score': 1},
        {'text': 'FlatButton', 'score': 0},
        {'text': 'IconButton', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "setState" method?',
      'answers': [
        {'text': 'To update the UI', 'score': 1},
        {'text': 'To manage state', 'score': 0},
        {'text': 'To create widgets', 'score': 0},
        {'text': 'To handle user input', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the tallest mammal??',
      'answers': [
        {'text': 'Elephant', 'score': 0},
        {'text': 'Giraffe', 'score': 1},
        {'text': 'Kangaroo', 'score': 0},
        {'text': 'Horse', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "async" keyword in Dart?',
      'answers': [
        {'text': 'To define asynchronous functions', 'score': 1},
        {'text': 'To handle exceptions', 'score': 0},
        {'text': 'To create streams', 'score': 0},
        {'text': 'To manage memory', 'score': 0},
      ],
    },
    {
      'questionText': 'Which widget is used to display images in Flutter?',
      'answers': [
        {'text': 'Image', 'score': 1},
        {'text': 'Icon', 'score': 0},
        {'text': 'Picture', 'score': 0},
        {'text': 'ImageView', 'score': 0},
      ],
    },
  ];

  int questionIndex = 0;
  int totalScore = 0;
  int get currentQuestionIndex => questionIndex;
  List<Map<String, dynamic>> get questions => _questions;
  bool get isQuizFinished => questionIndex >= _questions.length;

  void answerQuestion(int score) {
    totalScore += score;
    questionIndex++;
    notifyListeners();
  }

  // double get progress => (questionIndex + 1);

  double getProgress() {
    return ((currentQuestionIndex + 1));
  }

  void resetQuiz() {
    questionIndex = 0;
    totalScore = 0;
    notifyListeners();
  }
}
