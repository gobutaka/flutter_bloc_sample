import 'package:flutter_bloc_sample/blocs/counter_bloc.dart';
import 'package:flutter_bloc_sample/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // providerを使うとchildに指定したWidget以下の全てのWidgetで同じblocインスタンスにアクセスできる
      home: Provider<CounterBloc>(
        /*
          インスタンスの生成処理を指定する
          providerがwidgetツリーに追加されるときに一度だけ実行される
        */
        create: (context) => CounterBloc(),
        /*
          破棄用メソッドを指定する
          providerがwidgetツリーから外されるタイミングで実行される
        */
        dispose: (context, bloc) => bloc.dispose(),
        // widgetを渡す
        child: CounterScreen(title: 'Flutter Demo Home Page'),
      )
    );
  }
}
