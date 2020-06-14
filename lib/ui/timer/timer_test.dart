import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/ui/timer/ticker.dart';
import 'package:flutterapp/ui/timer/timer_actions.dart';
import 'package:flutterapp/ui/timer/timer_background.dart';

import 'bloc/bloc.dart';

//https://www.jianshu.com/p/47a3a6e6cc57
class TimerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      title: 'Flutter Timer',
      home: BlocProvider(
        create: (ctx) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Time')),
        body: Stack(
          children: <Widget>[
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(
                    child: BlocBuilder<TimerBloc, TimerState>(
                      builder: (ctx, state) {
                        final String minuteStr = ((state.duration / 60) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        final String secondStr = (state.duration % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        return Text(
                          '$minuteStr : $secondStr',
                          style: Timer.timerTextStyle,
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<TimerBloc, TimerState>(
                  condition: (previousState, currentState) =>
                      currentState.runtimeType != previousState.runtimeType,
                  builder: (ctx, state) => TimerActions(),
                )
              ],
            )
          ],
        ));
  }
}
