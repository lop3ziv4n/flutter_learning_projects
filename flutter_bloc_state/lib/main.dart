import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_state/pages/example_one_page.dart';
import 'package:flutter_bloc_state/pages/example_two_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const ExampleOnePage(),
          'pagina2': (_) => const ExampleTwoPage(),
        },
      ),
    );
  }
}
