import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class TimerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
          timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;

    if (currentState is ReadyState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              timerBloc.add(StartEvent(duration: currentState.duration)),
        )
      ];
    } else if (currentState is RunningState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(PausedEvent()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(ResetEvent()),
        )
      ];
    } else if (currentState is PausedState) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => timerBloc.add(ResumedEvent())),
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(ResumedEvent()),
        )
      ];
    } else if (currentState is FinishedState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(ResetEvent()),
        )
      ];
    } else {
      return [];
    }
  }
}
