import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState();
}

class InitialTimerState extends TimerState {
  @override
  List<Object> get props => [];
}
