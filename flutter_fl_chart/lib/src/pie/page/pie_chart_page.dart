import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widget/indicators_widget.dart';
import '../widget/pie_chart_sections.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: IndicatorsWidget(),
                ),
              ],
            ),
          ],
        ),
      );
}
