import 'package:flutter_bloc_sample/blocs/counter_bloc.dart';
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
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // blocは子widgetのbuild()メソッドで呼ぶのが定番
    final counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // StreamBuilderを使うことで、この箇所だけUIを更新することができる
            StreamBuilder(
              initialData: 0,
              stream: counterBloc.count,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // カウントアップアクションをblocに送る
          counterBloc.increment.add(null);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
