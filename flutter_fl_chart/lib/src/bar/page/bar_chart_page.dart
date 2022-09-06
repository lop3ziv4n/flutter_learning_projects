import 'package:flutter/material.dart';

import '../widget/bar_chart_widget.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: const Color(0xff020227),
        child: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: BarChartWidget(),
        ),
      );
}
