import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drawer_menu/src/zoom_drawer/bloc/navigation_bloc.dart';

class MainScreen extends StatelessWidget {
  final zoomDrawerController;

  const MainScreen({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (_, state) {
        return _makeNavigationScaffold(state.item);
      },
    );
  }

  Widget _makeNavigationScaffold(NavigationItem navigationItem) => Scaffold(
        appBar: AppBar(
          title: _title(navigationItem),
          backgroundColor: Colors.deepPurpleAccent,
          leading: InkWell(
            onTap: () => zoomDrawerController.toggle(),
            child: const Icon(Icons.menu),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Center(
            child: _title(navigationItem),
          ),
        ),
      );

  Widget _title(NavigationItem navigationItem) {
    switch (navigationItem) {
      case NavigationItem.homePage:
        return const Text("Home Page");
      case NavigationItem.mapPage:
        return const Text("Map Page");
      case NavigationItem.walletPage:
        return const Text("Wallet Page");
      default:
        return const Text("No Found");
    }
  }
}
