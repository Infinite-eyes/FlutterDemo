
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  List<Object> get props => [];
}

class StartEvent extends TimerEvent {
  final int duration;

  const StartEvent({@required this.duration});

  @override
  String toString() {return 'Start {duration: $duration}';}
}

class PausedEvent extends TimerEvent {}

class ResumedEvent extends TimerEvent {}

class ResetEvent extends TimerEvent {}

class TickEvent extends TimerEvent {
  final int duration;

  const TickEvent({@required this.duration});

  @override
  List<Object> get props => [this.duration];

  @override
  String toString() {
    return 'Tick {duration: $duration}';
  }
}
