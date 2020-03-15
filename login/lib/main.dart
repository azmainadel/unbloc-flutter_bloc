import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/authentication/authentication_bloc.dart';
import 'package:login/bloc/bloc.dart';
import 'package:login/data/user_repository.dart';
import 'package:login/ui/components/loading_indicator.dart';
import 'package:login/ui/pages/home_page.dart';
import 'package:login/ui/pages/login_page.dart';
import 'package:login/ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthUninitializedState) {
              return SplashPage();
            }

            if (state is AuthInitializingState) {
              return LoadingIndicator();
            }

            if (state is AuthenticatedState) {
              return HomePage();
            }

            if (state is UnauthenticatedState) {
              return LoginPage(userRepository: userRepository);
            }

            return null;
          },
        ),
      ),
    );
  }
}
