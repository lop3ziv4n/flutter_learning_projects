import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';

class MenuScreen extends StatelessWidget {
  final zoomDrawerController;

  const MenuScreen({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBloc =
        BlocProvider.of<NavigationBloc>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: AssetImage('assets/images/person.png'),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'John Wick',
                        style: TextStyle(color: Colors.white24, fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2.0, color: Colors.white24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  zoomDrawerController.toggle();
                  navigationBloc
                      .add(NavigationItemEvent(NavigationItem.homePage));
                },
                child: Row(children: const [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ]),
              ),
            ),
            const Divider(thickness: 2.0, color: Colors.white24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  zoomDrawerController.toggle();
                  navigationBloc
                      .add(NavigationItemEvent(NavigationItem.mapPage));
                },
                child: Row(children: const [
                  Icon(Icons.map, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Map',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ]),
              ),
            ),
            const Divider(thickness: 2.0, color: Colors.white24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  zoomDrawerController.toggle();
                  navigationBloc
                      .add(NavigationItemEvent(NavigationItem.walletPage));
                },
                child: Row(children: const [
                  Icon(Icons.money, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Wallet',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ]),
              ),
            ),
            const Divider(thickness: 2.0, color: Colors.white24),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => zoomDrawerController.toggle(),
                child: Row(children: const [
                  Icon(Icons.exit_to_app, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
