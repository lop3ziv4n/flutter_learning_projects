import 'package:flutter/material.dart';
import 'package:flutter_drawer_menu/src/menu_drawer/screens/first_v2.dart';
import 'package:flutter_drawer_menu/src/menu_drawer/screens/second_v2.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: const Menu(),
      screenSelectedBuilder: (position, controller) {
        Widget screenCurrent = const FirstV2Screen();

        switch (position) {
          case 0:
            screenCurrent = const FirstV2Screen();
            break;
          case 1:
            screenCurrent = const SecondV2Screen();
            break;
          case 2:
            screenCurrent = const FirstV2Screen();
            break;
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  controller.toggle();
                }),
          ),
          body: screenCurrent,
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late SimpleHiddenDrawerController _controller;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = SimpleHiddenDrawerController.of(context);
    _controller.addListener(() {
      if (_controller.state == MenuState.open) {
        _animationController.forward();
      }

      if (_controller.state == MenuState.closing) {
        _animationController.reverse();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          FadeTransition(
            opacity: _animationController,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _controller.setSelectedMenuPosition(0);
                        },
                        child: const Text(
                          "Menu 1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _controller.setSelectedMenuPosition(1);
                        },
                        child: const Text(
                          "Menu 2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
