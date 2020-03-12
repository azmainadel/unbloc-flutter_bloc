import 'package:counter/bloc/counter/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  //Bloc<input: event, output:state>

  //Always set the initial state. Here the state is an integer.
  //So we start the count from 0
  @override
  int get initialState => 0;


}
