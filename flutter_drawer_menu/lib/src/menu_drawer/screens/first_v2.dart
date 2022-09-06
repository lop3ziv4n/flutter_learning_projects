import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class FirstV2Screen extends StatelessWidget {
  const FirstV2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Screen 1",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            ElevatedButton(
              child: const Text('Toggle'),
              onPressed: () {
                SimpleHiddenDrawerController.of(context).toggle();
              },
            )
          ],
        ),
      ),
    );
  }
}
