import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_state/models/user.dart';

class ExampleTwoPage extends StatelessWidget {
  const ExampleTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                    name: 'Fernando',
                    age: 36,
                    professions: ['FullStack Developer']);

                // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                userBloc.add(ActivateUser(newUser));
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(25));
              }),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfession('Nueva Profesión'));
              }),
        ],
      )),
    );
  }
}
