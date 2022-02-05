import 'package:bloc/bloc.dart';
import 'package:counter_app/app.dart';
import 'package:counter_app/counter_observer.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );
}
