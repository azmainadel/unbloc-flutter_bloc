import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/bloc/bloc.dart';
import 'package:timer/ui/utils/ui_constants.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70.0),
            child: Center(
              child: BlocBuilder<TimerBloc, TimerState>(
                builder: (context, state) {
                  final String minutesStr = ((state.remainingTicks / 60) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, '0');
                  final String secondsStr = (state.remainingTicks % 60)
                      .floor()
                      .toString()
                      .padLeft(2, '0');
                  return Text(
                    '$minutesStr:$secondsStr',
                    style: kTimerTextStyle,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
