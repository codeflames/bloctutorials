import 'package:flutter/material.dart';
import 'package:flutter_timer/theme/colors.dart';
import 'package:flutter_timer/timer/view/timer_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Bloc Timer App',
        theme: ThemeData(
            primaryColor: primaryColor,
            colorScheme: ColorScheme.light(secondary: secondaryColor)),
        home: TimerPage());
  }
}
