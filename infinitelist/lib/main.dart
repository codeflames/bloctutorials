import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinitelist/app.dart';
import 'package:infinitelist/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(App()),
      blocObserver: SimpleBlocObserver());
}
