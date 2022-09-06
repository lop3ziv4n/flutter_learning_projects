import 'package:flutter/material.dart';

//import 'package:flutter_drawer_menu/src/menu_drawer/screens/menu_drawer.dart';
//import 'package:flutter_drawer_menu/src/menu_drawer/screens/menu_drawer_v2.dart';
//import 'package:flutter_drawer_menu/src/advanced_drawer/screens/advanced_drawer.dart';
//import 'package:flutter_drawer_menu/src/slider_drawer/screens/slider_drawer.dart';
import 'package:flutter_drawer_menu/src/zoom_drawer/screens/zoom_drawer.dart';

void main() => runApp(const MyApp());

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
