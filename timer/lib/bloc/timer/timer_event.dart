import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final int remainingTicks;

  const Start({@required this.remainingTicks});

  @override
  String toString() => "Started for $remainingTicks ticks";
}

class Tick extends TimerEvent {
  final int remainingTicks;

  const Tick({@required this.remainingTicks});

  @override
  List<Object> get props => [remainingTicks];

  @override
  String toString() => "Tick $remainingTicks";
}

class Pause extends TimerEvent {
  final int remainingTicks;

  const Pause({@required this.remainingTicks});

  @override
  String toString() => "Paused at $remainingTicks ticks";
}

class Resume extends TimerEvent {
  final int remainingTicks;

  const Resume({@required this.remainingTicks});

  @override
  String toString() => "Resumed from $remainingTicks ticks";
}

class Reset extends TimerEvent {
  final int remainingTicks;

  const Reset({@required this.remainingTicks});

  @override
  String toString() => "Reset at $remainingTicks ticks";
}
