import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twofingerpinch/bloc/increment_bloc/increment_bloc.dart';
import 'package:twofingerpinch/home_page/home_screen_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final incrementBloc = IncrementBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => incrementBloc,
      child: MaterialApp(
        title: 'Two finger pinch Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreenBloc(),
      ),
    );
  }
}
