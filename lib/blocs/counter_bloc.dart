import 'dart:async';

class CounterBloc {
  // ボタンによるカウントアップ入力を受け付けるStreamController
  final _actionController = StreamController<void>();
  // _actionControllerのsink(受け取り口)をincreamentとする
  Sink<void> get increment => _actionController.sink;

  // _actionControllerからカウントアップした値を受け取るStreamController
  final _countController = StreamController<int>();
  // _countControllerのstream(出力口)をcountとする
  Stream<int> get count => _countController.stream;

  int _count = 0;

  CounterBloc() {
    // _actionControllerに値が流れてきた時
    _actionController.stream.listen((_) {
      _count++;
      // _countControllerに_countを流す
      _countController.sink.add(_count);
    });
  }

  void dispose() {
    _actionController.close();
    _countController.close();
  }
}
