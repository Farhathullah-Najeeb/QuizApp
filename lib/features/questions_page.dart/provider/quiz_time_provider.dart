import 'dart:async';

import 'package:flutter/material.dart';

class TimerModelProvider extends ChangeNotifier {
  int _remainingTime = 10; // 60 seconds
  bool _quizOver = false;

  int get remainingTime => _remainingTime;
  bool get quizOver => _quizOver;

  Timer? _timer;

  TimerModelProvider() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime--;
      if (_remainingTime <= 0) {
        _quizOver = true;
        _timer?.cancel();
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _remainingTime = 10; // Reset time to original duration
    _quizOver = false;
    _startTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
