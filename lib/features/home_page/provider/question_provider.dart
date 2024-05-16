import 'package:flutter/material.dart';
import 'package:zealosh/hive/hive.dart';

class QuizProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {
          'text': 'A. A programming language',
          'score': 0,
        },
        {
          'text': 'B. A web framework',
          'score': 0,
        },
        {
          'text': 'C. A mobile UI framework',
          'score': 1,
        },
        {
          'text': 'D. A game',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'What does the acronym "Dart" stand for?',
      'answers': [
        {
          'text': 'A. Digital Art',
          'score': 0,
        },
        {'text': 'B. Dynamic and Rapid Technology', 'score': 0},
        {'text': 'C. Developed App Runtime', 'score': 0},
        {'text': 'D. Structured Web Programming Language', 'score': 1},
      ],
    },
    {
      'questionText':
          'Which widget is used to display a list of items in Flutter?',
      'answers': [
        {'text': 'A. ListView', 'score': 1},
        {'text': 'B. GridView', 'score': 0},
        {'text': 'C. Column', 'score': 0},
        {'text': 'D. Row', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "BuildContext" in Flutter?',
      'answers': [
        {'text': 'A. To manage state', 'score': 0},
        {'text': 'B. To build widgets', 'score': 1},
        {'text': 'C. To handle user input', 'score': 0},
        {'text': 'D. To define routes', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the main function in a Flutter app?',
      'answers': [
        {'text': 'A. The entry point of the app', 'score': 1},
        {'text': 'B. The root widget', 'score': 0},
        {'text': 'C. The first screen displayed', 'score': 0},
        {'text': 'D. The app configuration', 'score': 0},
      ],
    },
    {
      'questionText': 'Which widget is used to create a button in Flutter?',
      'answers': [
        {'text': 'A. TextButton', 'score': 0},
        {'text': 'B. ElevatedButton', 'score': 1},
        {'text': 'C. FlatButton', 'score': 0},
        {'text': 'D. IconButton', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "setState" method?',
      'answers': [
        {'text': 'A. To update the UI', 'score': 1},
        {'text': 'B. To manage state', 'score': 0},
        {'text': 'D. To create widgets', 'score': 0},
        {'text': 'C..To handle user input', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the tallest mammal??',
      'answers': [
        {'text': 'A. Elephant', 'score': 0},
        {'text': 'B. Giraffe', 'score': 1},
        {'text': 'C. Kangaroo', 'score': 0},
        {'text': 'D. Horse', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of the "async" keyword in Dart?',
      'answers': [
        {'text': 'A. To define asynchronous functions', 'score': 1},
        {'text': 'B. To handle exceptions', 'score': 0},
        {'text': 'C. To create streams', 'score': 0},
        {'text': 'D. To manage memory', 'score': 0},
      ],
    },
    {
      'questionText': 'Which widget is used to display images in Flutter?',
      'answers': [
        {'text': 'A. Image', 'score': 1},
        {'text': 'B. Icon', 'score': 0},
        {'text': 'C. Picture', 'score': 0},
        {'text': 'D. ImageView', 'score': 0},
      ],
    },
  ];

  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnswerIndex = -1;
  int answerIndex = 0;
  int totalScore = 0;

  bool isQuizFinished = false;
  bool isProcessing = false;
  int get currentQuestionIndex => questionIndex;
  int get currentAnswerIndex => answerIndex;
  int _participants = 0;
  int get participants => _participants;
  List<Map<String, dynamic>> get questions => _questions;

  void increment() {
    _participants++;
    notifyListeners();
  }

  void answerQuestion({required int score, required Function() quizFinished}) {
    if (questionIndex >= _questions.length - 1) {
      isQuizFinished = true;
      resetSelectedAnswer();
      quizFinished();

      print("Quiz finished");
    } else {
      totalScore += score;
      resetSelectedAnswer();
      questionIndex++;
      isQuizFinished = false;
    }
    print("Score is $totalScore");
    notifyListeners();
  }

  double getProgress() {
    return (currentQuestionIndex) / questions.length;
  }

  void resetQuiz() {
    questionIndex = 0;
    totalScore = 0;

    notifyListeners();
  }

  void resetSelectedAnswer() {
    correctAnswerIndex = -1;
    selectedAnswerIndex = -1;
    notifyListeners();
  }

  final CounterStorage _storage = CounterStorage();
  int get counter => _storage.counterValue;
  Future<void> increments() async {
    await _storage.incrementCounter();
    notifyListeners();
  }

  // void showCorrectAnswer(bool selectedAnswerIsTrue) {
  //   if (selectedAnswerIsTrue) {
  //     _questions[questionIndex]['answers'][answerIndex]['color'] = Colors.green;
  //     print("User selected the true answer");
  //   } else {
  //     _questions[questionIndex]['answers'][answerIndex]['color'] = Colors.red;
  //     print("User selected the false answer");
  //   }
  //   for (var answer in _questions[questionIndex]['answers']) {
  //     if (answer['score'] == 1) {
  //       answer['color'] = Colors.green;
  //       print("The correct answer is: ${answer['text']}");
  //     }
  //   }
  //   notifyListeners();
  // }

  void isCheckSelectedAnsweriSCorrect(
      {required Map<String, dynamic> selectedAnswer,
      required int selectedAnswerIndex1}) {
    selectedAnswerIndex = selectedAnswerIndex1;

    for (int i = 0; i < _questions[questionIndex]['answers'].length; i++) {
      var answer = _questions[questionIndex]['answers'][i];
      if (answer['score'] == 1) {
        correctAnswerIndex = i; // Update index only if correct answer is found
        break; // Exit the loop once correct answer is found (optional)
      }
    }
    notifyListeners();
  }
}
