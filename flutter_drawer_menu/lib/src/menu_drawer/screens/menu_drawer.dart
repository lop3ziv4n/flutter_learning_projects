import 'package:flutter/material.dart';
import 'package:flutter_drawer_menu/src/menu_drawer/screens/first.dart';
import 'package:flutter_drawer_menu/src/menu_drawer/screens/second.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScreenHiddenDrawer> items = [];

  @override
  void initState() {
    items.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Page 1',
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const FirstScreen(),
      ),
    );

    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Page 2',
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(color: Colors.black),
        ),
        const SecondScreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.green,
      screens: items,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 60.0,
      verticalScalePercent: 90.0,
      contentCornerRadius: 15.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
          elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      backgroundMenu: const DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover),
    );
  }
}
