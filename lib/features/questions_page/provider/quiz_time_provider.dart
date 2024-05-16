import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TimerModelProvider extends ChangeNotifier {
  int _remainingTime = 60; // 60 seconds
  bool _quizOver = false;
  late Timer _timer;

  int get remainingTime => _remainingTime;
  bool get quizOver => _quizOver;

  TimerModelProvider() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime <= 0) {
        _quizOver = true;
        timer.cancel();
      } else {
        _remainingTime--;
      }
      notifyListeners();
    });
  }

  String getFormattedTime() {
    int minutes = (_remainingTime / 60).floor();
    int seconds = _remainingTime % 60;
    return '$minutes:${seconds < 10 ? '0' : ''}$seconds';
  }

  void resetTimer() {
    _remainingTime = 60;
    _quizOver = false;
    _timer.cancel();
    startTimer();
    notifyListeners();
  }

  void stopTimmer() {
    _remainingTime = 60;
    _quizOver = false;
    _timer.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _remainingTime = 60;
    _timer.cancel();
    super.dispose();
  }
}
