import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/bar_data.dart';
import 'bar_titles.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 22;

  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 20,
          minY: -20,
          groupsSpace: 12,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: BarTitles.getTopBottomTitles()),
            bottomTitles:
                AxisTitles(sideTitles: BarTitles.getTopBottomTitles()),
            leftTitles: AxisTitles(sideTitles: BarTitles.getSideTitles()),
            rightTitles: AxisTitles(sideTitles: BarTitles.getSideTitles()),
          ),
          gridData: FlGridData(
            checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
            getDrawingHorizontalLine: (value) {
              if (value == 0) {
                return FlLine(
                  color: const Color(0xff363753),
                  strokeWidth: 3,
                );
              } else {
                return FlLine(
                  color: const Color(0xff2a2747),
                  strokeWidth: 0.8,
                );
              }
            },
          ),
          barGroups: BarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: barWidth,
                      borderRadius: data.y > 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
