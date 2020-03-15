import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/data/user_repository.dart';

import '../bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(userRepository != null);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginPressed) {
      //Show loading view
      yield LoginLoadingState();

      try {
        //Search for token, if found set event logged in
        final token = await userRepository.authenticate(
            userName: event.username, password: event.password);

        if (token != null) {
          authenticationBloc.add(LoggedIn(token: token));
          yield LoginInitialState();
        }
      } catch (e) {
        //If no token, show failed message
        yield LoginFailureState(errorText: e.toString());
      }
    }
  }
}
