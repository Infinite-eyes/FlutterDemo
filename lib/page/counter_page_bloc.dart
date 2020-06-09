//https://www.jianshu.com/p/4d5e712594b4
import 'dart:async';

import 'package:flutter/material.dart';

class CounterBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);


    //这样也可以但是数据暴露在外层了
    var _counter = 1;

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me:${snapshot.data} times');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter.add(_counter++);
        },
      ),
    );
  }
}

class IncrementBloc implements BlocBase {

  int _counter;

//  StreamController<int> _counterController = StreamController<int>();
////
//  StreamSink<int> get _inAdd => _counterController.sink;
////
//  Stream<int> get outCounter => _counterController.stream;

  StreamController<int> _actionController = StreamController();

  Stream<int> get outCounter => _actionController.stream;

  StreamSink get incrementCounter => _actionController.sink;

  IncrementBloc() {
    _counter = 0;
//    _actionController.stream.listen(_handleLogic);
  }

  @override
  void dispose() {
    _actionController.close();
//    _counterController.close();
  }

//  void _handleLogic(data) {
//    _counter = _counter + 1;
//    _inAdd.add(_counter);
//  }
}

abstract class BlocBase {
  void dispose();
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    this.child,
    this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
//    context.getElementForInheritedWidgetOfExactType<type>().widget;
//    context.findAncestorWidgetOfExactType();
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}
