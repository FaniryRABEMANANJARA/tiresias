// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    Key? key,
    this.width,
    this.height,
    this.chartTitle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? chartTitle;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  List<ChartDataStruct> eurChartData = [];
  List<ChartDataStruct> usdChartData = [];
  double? eurUsdRate;

  @override
  void initState() {
    super.initState();
    fetchConversionRates();
  }

  Future<void> fetchConversionRates() async {
    final eurResponse = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/2ef6a82e850a04e540b31421/latest/EUR'));
    final usdResponse = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/2ef6a82e850a04e540b31421/latest/USD'));

    if (eurResponse.statusCode == 200 && usdResponse.statusCode == 200) {
      final eurData = json.decode(eurResponse.body);
      final usdData = json.decode(usdResponse.body);

      final eurRates = Map<String, double>.from(eurData['conversion_rates']);
      final usdRates = Map<String, double>.from(usdData['conversion_rates']);

      setState(() {
        eurUsdRate = eurRates['USD'];

        eurChartData = eurRates.entries.map((entry) {
          return ChartDataStruct(
            xTitle: entry.key,
            rate: entry.value,
          );
        }).toList();

        usdChartData = usdRates.entries.map((entry) {
          return ChartDataStruct(
            xTitle: entry.key,
            rate: entry.value,
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to load conversion rates');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (eurUsdRate != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EUR/USD: \$${eurUsdRate!.toStringAsFixed(4)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        if (eurChartData.isNotEmpty && usdChartData.isNotEmpty)
          Expanded(
            child: SfCartesianChart(
              title: ChartTitle(
                  text: widget.chartTitle ??
                      'Prix actuels de l\'EUR et de l\'USD'),
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                labelRotation: 90,
                labelStyle: TextStyle(color: Colors.black),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(
                  color: Colors.black.withOpacity(0.3),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                textStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
              series: <CartesianSeries<ChartDataStruct, String>>[
                ColumnSeries<ChartDataStruct, String>(
                  dataSource: eurChartData,
                  xValueMapper: (ChartDataStruct data, _) => data.xTitle,
                  yValueMapper: (ChartDataStruct data, _) => data.rate,
                  name: 'EUR',
                  enableTooltip: true,
                  color: Colors.blue,
                ),
                ColumnSeries<ChartDataStruct, String>(
                  dataSource: usdChartData,
                  xValueMapper: (ChartDataStruct data, _) => data.xTitle,
                  yValueMapper: (ChartDataStruct data, _) => data.rate,
                  name: 'USD',
                  enableTooltip: true,
                  color: Colors.red,
                ),
              ],
              backgroundColor: Colors.white,
            ),
          ),
      ],
    );
  }
}

class ChartDataStruct {
  final String xTitle;
  final double rate;

  ChartDataStruct({
    required this.xTitle,
    required this.rate,
  });
}
