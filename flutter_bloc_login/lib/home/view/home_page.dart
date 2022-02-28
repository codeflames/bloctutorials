import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/authentication/bloc/authentication_bloc.dart';
// import 'package:flutter_login/authentication/authentication.dart';
import 'package:user_repository/user_repository.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: AuthenticationRepository(),
            userRepository: UserRepository()),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Builder(
              //   builder: (context) {
              //     final userId = context.select(
              //       (AuthenticationBloc bloc) => bloc.state.user.userId,
              //     );
              // return
              Text(
                  'UserID: ${context.read<AuthenticationBloc>().state.user.userId}'),
              Text(
                  'UserEmail: ${context.read<AuthenticationBloc>().state.user.email}'),
              // },
              // ),
              ElevatedButton(
                child: const Text('Logout'),
                onPressed: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
