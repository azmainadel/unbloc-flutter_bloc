import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/bloc/bloc.dart';
import 'package:timer/data/ticker.dart';
import 'package:timer/pages/timer_page.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: TimerPage(),
      ),
    );
  }
}
