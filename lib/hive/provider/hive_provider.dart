import 'package:flutter/material.dart';
import 'package:zealosh/hive/hive.dart';

class StorageProvider with ChangeNotifier {
  final CounterStorage _storage = CounterStorage();

  int get counterss => _storage.counterValue;

  Future<void> increment() async {
    await _storage.incrementCounter();
    notifyListeners();
  }
}