import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/bar_data.dart';

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTitlesWidget: (double value, TitleMeta meta) => Center(
          child: Text(
            BarData.barData
                .firstWhere((element) => element.id == value.toInt())
                .name,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        interval: BarData.interval.toDouble(),
        reservedSize: 30,
        getTitlesWidget: (double value, TitleMeta meta) => Text(
          value == 0 ? '0' : '${value.toInt()}k',
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
}
