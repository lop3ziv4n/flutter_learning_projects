import 'package:flutter/material.dart';
import 'package:flutter_get_x/articles/providers/articles_provider.dart';
import 'package:flutter_get_x/screens/headlines_screen.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => ArticlesProvider());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'headlines',
      routes: {
        'headlines': (context) => const HeadlinesScreen(),
      },
    );
  }
}
