import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginPressed({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
