// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    this.chartTitle,
    this.date,
  });

  final double? width;
  final double? height;
  final String? chartTitle;
  final DateTime? date;
  final List<ChartDataStruct> chartData;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            title: ChartTitle(text: widget.chartTitle ?? ''),
            primaryXAxis: CategoryAxis(),
            primaryYAxis:
                NumericAxis(minimum: 0, maximum: 100000, interval: 500),
            tooltipBehavior: TooltipBehavior(enable: true),
            enableSideBySideSeriesPlacement: false,
            series: <CartesianSeries<ChartDataStruct, String>>[
          LineSeries<ChartDataStruct, String>(
              dataSource: widget.chartData,
              xValueMapper: (ChartDataStruct data, _) => data.xTitle,
              yValueMapper: (ChartDataStruct data, _) => data.yValue1,
              name: 'Sell',
              color: Color.fromARGB(255, 255, 8, 8)),
          LineSeries<ChartDataStruct, String>(
              dataSource: widget.chartData,
              xValueMapper: (ChartDataStruct data, _) => data.xTitle,
              yValueMapper: (ChartDataStruct data, _) => data.yValue2,
              name: 'Buy',
              color: Color.fromARGB(255, 8, 255, 115))
        ]));
  }
}
