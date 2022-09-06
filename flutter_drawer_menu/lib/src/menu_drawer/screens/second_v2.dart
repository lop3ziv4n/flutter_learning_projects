import 'package:flutter/material.dart';

class SecondV2Screen extends StatelessWidget {
  const SecondV2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text("Screen 2",
            style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}
