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

  // 初期値0のCounterのインスタンスを作成する
  final _counter = Counter(value: 0);

  void increment() {
    // Counterモデルに書いてあるincrement()を実行
    _counter.increment();

    // _countControllerに_counter(Counterモデル)を流す
    _countController.sink.add(_counter);
  }

  void decrement() {
    // Counterモデルに書いてあるdecrement()を実行
    _counter.decrement();

    // _counterControllerに_counter(Counterモデル)を流す
    _countController.sink.add(_counter);
  }

  void dispose() {
    _countController.close();
  }
}
