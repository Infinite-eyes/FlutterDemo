import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  final int _duration = 60;

  final Ticker _ticker;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  @override
  TimerState get initialState => ReadyState(_duration);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    print('$event');

    if (event is StartEvent) {
      yield* _mapStartToState(event);
    } else if (event is TickEvent) {
      yield* _mapTickToState(event);
    } else if (event is PausedEvent) {
      yield* _mapPauseToState(event);
    }else if(event is ResumedEvent){
      yield* _mapResumeToState(event);
    }else if(event is ResetEvent){
      yield* _mapResetToState(event);
    }
  }

  @override
  Future<void> close(){
    _tickerSubscription?.cancel();
    return super.close();
  }


  Stream<TimerState> _mapStartToState(StartEvent start) async* {
    yield RunningState(start.duration);

    _tickerSubscription?.cancel();

    _tickerSubscription =
        _ticker.tick(ticks: start.duration).listen((duration) {
      add(TickEvent(duration: duration));
    });
  }

  Stream<TimerState> _mapTickToState(TickEvent tick) async* {
    yield tick.duration > 0 ? RunningState(tick.duration) : FinishedState();
  }

  Stream<TimerState> _mapPauseToState(PausedEvent pause) async* {
    if (state is RunningState) {
      _tickerSubscription?.pause();
      yield PausedState(state.duration);
    }
  }

  Stream<TimerState> _mapResumeToState(ResumedEvent resume) async* {
    if (state is PausedState) {
      _tickerSubscription?.resume();
      yield RunningState(state.duration);
    }
  }

  Stream<TimerState> _mapResetToState(ResetEvent reset) async* {
    _tickerSubscription?.cancel();
    yield ReadyState(_duration);
  }
}
