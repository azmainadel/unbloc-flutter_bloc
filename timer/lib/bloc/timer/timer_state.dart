import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int remainingTicks;

  const TimerState({this.remainingTicks});

  @override
  List<Object> get props => [remainingTicks];
}

//Ready to start counting
class Ready extends TimerState {
  const Ready(int remainingTicks) : super(remainingTicks: remainingTicks);

  @override
  String toString() => 'Ready { duration: $remainingTicks }';
}

//Paused on a count
class Paused extends TimerState {
  const Paused(int remainingTicks) : super(remainingTicks: remainingTicks);

  @override
  String toString() => 'Paused { duration: $remainingTicks }';
}

//Counting going on
class Running extends TimerState {
  const Running(int remainingTicks) : super(remainingTicks: remainingTicks);

  @override
  String toString() => 'Running { duration: $remainingTicks }';
}

//Counting finished for the given value
class Finished extends TimerState {
  const Finished() : super(remainingTicks: 0);
}
