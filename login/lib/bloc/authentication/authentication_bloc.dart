import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/data/user_repository.dart';

import '../bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthUninitializedState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

    if (event is LoggedIn) {
      yield AuthInitializingState();

      await userRepository.persistToken(event.token);
      yield AuthenticatedState();
    }

    if (event is LoggedOut) {
      yield AuthInitializingState();

      await userRepository.deleteToken();
      yield UnauthenticatedState();
    }
  }
}
