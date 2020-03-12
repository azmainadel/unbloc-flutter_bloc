import 'dart:async';

import 'package:bloc/bloc.dart';

import '../bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _remainingTicks = 60;

  @override
  TimerState get initialState => Ready(_remainingTicks);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is Start) {
    } else if (event is Tick) {
    } else if (event is Pause) {
    } else if (event is Resume) {
    } else if (event is Reset) {}
  }
}
