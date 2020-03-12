import 'package:counter/bloc/counter/counter_bloc.dart';
import 'package:counter/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

/*Main apps home should be a BlocProvider
* the screen will be it's child
* We need to init the Bloc in create*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: CounterPage(),
        ));
  }
}
