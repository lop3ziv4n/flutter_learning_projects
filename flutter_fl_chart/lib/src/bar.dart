import 'package:flutter/material.dart';

import 'bar/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FLChart Bar',
        theme: ThemeData(primaryColor: Colors.blueGrey[900]),
        home: const HomePage(),
      );
}
