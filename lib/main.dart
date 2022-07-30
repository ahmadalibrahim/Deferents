import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy/layout/home_layout.dart';
import 'package:udemy/modules/counter/counter_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:udemy/shared/MyBlocObserver.dart';

void main() {
  Bloc.observer =MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Conuter(),
      debugShowCheckedModeBanner: false,
    );
  }
}