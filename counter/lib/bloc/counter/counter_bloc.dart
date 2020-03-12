import 'package:counter/bloc/counter/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc<input: event, output:state>
class CounterBloc extends Bloc<CounterEvent, int> {
/*  Always set the initial state. Here the state is an integer.
  So we start the count from 0*/
  @override
  int get initialState => 0;

/* This maps which state to output for an event
  This is an asynchronous process,
   so we use 'yield' (for Streams), not return.*/
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increment) {
      yield state + 1;
    } else if (event == CounterEvent.decrement) {
      yield state - 1;
    }
  }
}
