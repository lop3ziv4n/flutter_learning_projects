import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/data/centile_input_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import 'data/centile_data.dart';
import 'models/centile.dart';
import 'services/centile_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

final CentileService _centileService = CentileService();

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _centileService.getCentiles("628f7d19d68900abc0078fbf"),
          builder: (_, AsyncSnapshot<ResponseCentileData> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("No hay datos"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No hay datos"),
              );
            }
            return SplineDashedPage(
              centilos: snapshot.data!.centilos,
            );
          },
        ),
      ),
    );
  }
}

class SplineDashedPage extends StatefulWidget {
  const SplineDashedPage({Key? key, required this.centilos}) : super(key: key);

  final List<Centilo> centilos;
  @override
  _SplineDashedPageState createState() => _SplineDashedPageState();
}

class _SplineDashedPageState extends State<SplineDashedPage> {
  late List<CentileData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = _getCentilesData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        enableDoubleTapZooming: true,
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.blue,
        selectionRectBorderWidth: 2,
        selectionRectColor: Colors.grey,
        enablePanning: true,
        zoomMode: ZoomMode.xy,
        enableMouseWheelZooming: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Yearly sales analysis (USD)'),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      zoomPanBehavior: _zoomPanBehavior,
      series: _getSeries(),
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelFormat: '{value}',
        majorGridLines: const MajorGridLines(width: 0),
        //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 3),
        interactiveTooltip: const InteractiveTooltip(enable: false),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        axisLine: const AxisLine(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorTickLines: const MajorTickLines(size: 0),
        //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 3),
        interactiveTooltip: const InteractiveTooltip(enable: false),
      ),
    );
  }

  List<ChartSeries<dynamic, dynamic>> _getSeries() {
    List<ChartSeries<dynamic, dynamic>> series = [];
    series.addAll(_getSplineSeries());
    series.addAll(_getScatterSeries());
    return series;
  }

  List<SplineSeries<CentileData, num>> _getSplineSeries() {
    return <SplineSeries<CentileData, num>>[
      SplineSeries<CentileData, num>(
          dataSource: _chartData,
          splineType: SplineType.cardinal,
          xValueMapper: (CentileData centile, _) => centile.edad,
          yValueMapper: (CentileData centile, _) => centile.centile3,
          width: 2,
          name: 'Centile 3',
          //dataLabelSettings: const DataLabelSettings(isVisible: true),
          //markerSettings: const MarkerSettings(isVisible: true),
          enableTooltip: true,
          markerSettings: const MarkerSettings(shape: DataMarkerType.diamond)),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.natural,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile10,
        width: 2,
        name: 'Centile 10',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.clamped,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile25,
        width: 2,
        name: 'Centile 25',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.monotonic,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile50,
        width: 2,
        name: 'Centile 50',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.natural,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile75,
        width: 2,
        name: 'Centile 75',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.natural,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile90,
        width: 2,
        name: 'Centile 90',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
      SplineSeries<CentileData, num>(
        dataSource: _chartData,
        splineType: SplineType.natural,
        xValueMapper: (CentileData centile, _) => centile.edad,
        yValueMapper: (CentileData centile, _) => centile.centile97,
        width: 2,
        name: 'Centile 97',
        //dataLabelSettings: const DataLabelSettings(isVisible: true),
        //markerSettings: const MarkerSettings(isVisible: true),
        enableTooltip: true,
      ),
    ];
  }

  List<ScatterSeries<CentileInputData, num>> _getScatterSeries() {
    return <ScatterSeries<CentileInputData, num>>[
      ScatterSeries<CentileInputData, num>(
        dataSource: const [CentileInputData(edad: 12, centile: 15)],
        name: 'Valor',
        xValueMapper: (CentileInputData data, _) => data.edad,
        yValueMapper: (CentileInputData data, _) => data.centile,
        color: Colors.black,
        markerSettings: const MarkerSettings(shape: DataMarkerType.circle),
      ),
    ];
  }

  List<CentileData> _getCentilesData() {
    return _centileService.getCentilesData(widget.centilos);
  }
}
