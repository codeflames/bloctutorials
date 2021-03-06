import 'dart:developer';

import 'package:counter_app/home/repository/home_repository.dart';

import 'package:counter_app/services/connectivityservice/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';

void main() {
  runApp(MyApp());

  (error, stackTrace) async {
    log('$error');
    log('$stackTrace');
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(providers: [
        RepositoryProvider(create: (context) => HomeRepository()),
        RepositoryProvider(create: (context) => ConnectivityService())
      ], child: HomePage()),
    );
  }
}
