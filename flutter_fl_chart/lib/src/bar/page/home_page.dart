import 'package:flutter/material.dart';

import 'bar_chart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('FLChart Bar'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: const [
              BarChartPage(),
            ],
          ),
        ),
      );
}
