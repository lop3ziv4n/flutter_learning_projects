import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_fl_chart/src/line/widget/bottom_title.dart';
import 'package:flutter_fl_chart/src/line/widget/left_title.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: BottomTitle.getBottomTitle),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              interval: 1,
              getTitlesWidget: LeftTitle.getLeftTitle),
        ),
      );
}
