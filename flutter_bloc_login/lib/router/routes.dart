import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_login/authentication/bloc/authentication_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // final AuthenticationRepository authenticationRepository;

  late final _router = GoRouter(
    // refreshListenable:
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(path: '/', builder: (context, state) => Container()),
      GoRoute(
        path: '/page2',
        builder: (context, state) => Container(),
      ),
    ],
  );

  // AppRoutes(this.authenticationRepository);
}
