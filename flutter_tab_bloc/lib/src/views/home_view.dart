import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/bottom_navigation_bloc.dart';
import '../widgets/custom_bottom_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<BottomNavigationBloc, int>(
          builder: (context, currentTab) {
            return Text('HomeScreen: $currentTab ');
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
