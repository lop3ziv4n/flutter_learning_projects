import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drawer_menu/src/zoom_drawer/bloc/navigation_bloc.dart';
import 'package:flutter_drawer_menu/src/zoom_drawer/screens/main_screen.dart';
import 'package:flutter_drawer_menu/src/zoom_drawer/screens/menu_screen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NavigationBloc())],
      child: Scaffold(
        body: ZoomDrawer(
          controller: zoomDrawerController,
          mainScreen: MainScreen(zoomDrawerController: zoomDrawerController),
          menuScreen: MenuScreen(zoomDrawerController: zoomDrawerController),
          borderRadius: 18.0,
          style: DrawerStyle.Style1,
          openCurve: Curves.easeInOut,
          closeCurve: Curves.easeOutBack,
          disableGesture: false,
          mainScreenTapClose: false,
          slideWidth: MediaQuery.of(context).size.width * 0.75,
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.grey,
          showShadow: true,
          angle: 0.0,
          clipMainScreen: true,
        ),
      ),
    );
  }
}
