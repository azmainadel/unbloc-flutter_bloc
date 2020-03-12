import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:timer/data/ticker.dart';

import '../bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker ticker;
  final int _remainingTicks = 60;

  //for getting int streams from ticker
  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required this.ticker});

  @override
  TimerState get initialState => Ready(_remainingTicks);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is Start) {
      yield Running(event.remainingTicks);

      //a?.f() (get f() if a is not null
      _tickerSubscription?.cancel();

      // we listen to the ticker.tick stream
      // and on every tick we add a Tick event with the remaining duration.
      _tickerSubscription = ticker.tick(ticks: event.remainingTicks).listen(
          (remainingTicks) => add(Tick(remainingTicks: remainingTicks)));
    } else if (event is Tick) {
      yield event.remainingTicks > 0
          ? Running(event.remainingTicks)
          : Finished();
    } else if (event is Pause) {
      if (state is Running) {
        _tickerSubscription?.pause();
        yield Paused(state.remainingTicks);
      }
    } else if (event is Resume) {
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.remainingTicks);
      }
    } else if (event is Reset) {
      _tickerSubscription?.cancel();
      yield Ready(_remainingTicks);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
