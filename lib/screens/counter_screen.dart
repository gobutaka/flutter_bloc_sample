import 'package:flutter_bloc_sample/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CenterTextWidget(),
            CounterNumberWidget(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IncrementButtonWidget(),
          const SizedBox(height: 8),
          DecrementButtonWidget(),
        ]
      ),
    );
  }
}

class CenterTextWidget extends StatelessWidget {
  const CenterTextWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('You have pushed the button this many times:');
  }
}

class CounterNumberWidget extends StatelessWidget {
  const CounterNumberWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 値を受け取る
    final counterBloc = Provider.of<CounterBloc>(context);
    // StreamBuilderを使うことで、この箇所だけUIを更新することができる
    return StreamBuilder(
      initialData: 0,
      stream: counterBloc.count,
      builder: (context, snapshot) {
        return Text(
          '${snapshot.data.value}',
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 値を受け取る
    final counterBloc = Provider.of<CounterBloc>(context);
    return FloatingActionButton(
      onPressed: () {
        // CounterBlocに書いてあるincrement()を実行
        counterBloc.increment();
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}


class DecrementButtonWidget extends StatelessWidget {
  const DecrementButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 値を受け取る
    final counterBloc = Provider.of<CounterBloc>(context);
    return FloatingActionButton(
      onPressed: () {
        // CounterBlocに書いてあるdecrement()を実行
        counterBloc.decrement();
      },
      tooltip: 'Decrement',
      child: Icon(Icons.remove),
    );
  }
}
