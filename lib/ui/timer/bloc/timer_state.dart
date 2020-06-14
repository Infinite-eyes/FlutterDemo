

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  List<Object> get props => [this.duration];
}

class ReadyState extends TimerState {
  const ReadyState(int duration) : super(duration);

  @override
  String toString() => 'Ready {duration:$duration}';
}

class PausedState extends TimerState {
  const PausedState(int duration) : super(duration);

  @override
  String toString() => 'Paused {duration: $duration}';
}

class RunningState extends TimerState {
  const RunningState(int duration) : super(duration);

  @override
  String toString() {
    'Running {duration: $duration}';
  }
}

class FinishedState extends TimerState {
  const FinishedState() : super(0);
}
