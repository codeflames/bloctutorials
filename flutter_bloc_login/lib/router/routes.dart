import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_login/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_login/home/view/home_page.dart';
import 'package:flutter_bloc_login/login/view/login_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // final AuthenticationRepository authenticationRepository;

  late final router = GoRouter(
    // refreshListenable:
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
          name: 'home_page',
          path: '/home',
          builder: (context, state) => HomePage()),
      GoRoute(
        name: 'login',
        path: '/',
        builder: (context, state) => LoginPage(),
      ),
    ],
  );

  // AppRoutes(this.authenticationRepository);
}
