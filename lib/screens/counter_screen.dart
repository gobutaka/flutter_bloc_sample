import 'package:flutter_bloc_sample/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({this.title});

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
                  '${snapshot.data.value}',
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
          counterBloc.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
