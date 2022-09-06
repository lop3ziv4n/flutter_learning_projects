import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_bloc/src/blocs/simple_bloc_observer.dart';
import 'package:flutter_tab_bloc/src/screens/home_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: SimpleBlocOBserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeScreen());
  }
}
