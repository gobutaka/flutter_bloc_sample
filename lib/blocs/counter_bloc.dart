import 'package:flutter_bloc_sample/models/counter.dart';
import 'dart:async';

class CounterBloc {
  // コンストラクタ（クラスのインスタンス生成時に実行される）
  CounterBloc() {
    _countController.sink.add(_counter);
  }

  // _actionControllerからカウントアップした値を受け取るStreamController
  final _countController = StreamController<Counter>();

   // _countControllerのstream(出力口)をcountとする
  Stream<Counter> get count => _countController.stream;

  final _counter = Counter();

  void increment() {
    _counter.increment();

    // _countControllerに_countを流す
    _countController.sink.add(_counter);
  }

  void decrement() {
    _counter.decrement();

    // _counterControllerに_countを流す
    _countController.sink.add(_counter);
  }

  void dispose() {
    _countController.close();
  }
}
