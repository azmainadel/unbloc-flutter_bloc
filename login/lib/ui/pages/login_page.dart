import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/bloc.dart';
import 'package:login/data/user_repository.dart';

import 'login_form_page.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({@required this.userRepository}) : assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: LoginForm(),
      ),
    );
  }
}
