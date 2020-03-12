import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int remainingTime;

  const TimerState({this.remainingTime});

  @override
  List<Object> get props => [remainingTime];
}

//Ready to start counting
class Ready extends TimerState {
  const Ready(int duration) : super(remainingTime: duration);

  @override
  String toString() => 'Ready { duration: $remainingTime }';
}

//Paused on a count
class Paused extends TimerState {
  const Paused(int duration) : super(remainingTime: duration);

  @override
  String toString() => 'Paused { duration: $remainingTime }';
}

//Counting going on
class Running extends TimerState {
  const Running(int duration) : super(remainingTime: duration);

  @override
  String toString() => 'Running { duration: $remainingTime }';
}

//Counting finished for the given value
class Finished extends TimerState {
  const Finished() : super(remainingTime: 0);
}
