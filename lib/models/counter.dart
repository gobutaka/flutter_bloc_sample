// @requiredを使えるようにする
import 'package:meta/meta.dart';

class Counter {
  Counter({
    // 必須パラメータであることを示すアノテーション
    @required int value
  }) : _value = value;

  int _value;
  int get value => _value;

  void increment() {
    _value += 1;
  }

  void decrement() {
    _value -= 1;
  }
}
