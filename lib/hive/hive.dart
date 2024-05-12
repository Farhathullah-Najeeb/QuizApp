import 'package:hive/hive.dart';

class CounterStorage {
  final Box<int> _box = Hive.box<int>('counterBox');

  int get counterValue => _box.get('counter', defaultValue: 0)!;
  Future<void> incrementCounter() async {
    await _box.put('counter', counterValue + 1);
  }
}