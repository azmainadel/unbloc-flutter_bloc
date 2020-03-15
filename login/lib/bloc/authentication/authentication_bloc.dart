import 'dart:async';

import 'package:bloc/bloc.dart';

import '../bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {}

    if (event is LoggedIn) {}

    if (event is LoggedOut) {}
  }
}
