// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart'; // Ajouté pour formater la date

class Historique extends StatefulWidget {
  const Historique({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  List<ChartDataStruct> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchHistoricalData();
  }

  Future<void> fetchHistoricalData() async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=EUR&to_symbol=USD&apikey=DFROWMPFRDA1IFQ8'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Time Series FX (Daily)'] != null) {
        chartData = (data['Time Series FX (Daily)'] as Map<String, dynamic>)
            .entries
            .map((entry) {
          final date = DateTime.parse(entry.key);
          final open = double.parse(entry.value['1. open']);
          final high = double.parse(entry.value['2. high']);
          final low = double.parse(entry.value['3. low']);
          final close = double.parse(entry.value['4. close']);
          return ChartDataStruct(
            xTitle: date,
            open: open,
            high: high,
            low: low,
            close: close,
          );
        }).toList();
        setState(() {});
      }
    } else {
      throw Exception('Failed to load historical data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Historique des taux EUR/USD'),
        primaryXAxis: DateTimeAxis(
          title: AxisTitle(text: 'Date'),
          intervalType: DateTimeIntervalType.days,
          dateFormat: DateFormat.yMd(),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Taux de Change (USD)'),
        ),
        series: <CandleSeries<ChartDataStruct, DateTime>>[
          CandleSeries<ChartDataStruct, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartDataStruct data, _) => data.xTitle,
            lowValueMapper: (ChartDataStruct data, _) => data.low,
            highValueMapper: (ChartDataStruct data, _) => data.high,
            openValueMapper: (ChartDataStruct data, _) => data.open,
            closeValueMapper: (ChartDataStruct data, _) => data.close,
            dataLabelSettings: DataLabelSettings(
                isVisible: true), // Affiche les labels de données
          ),
        ],
      ),
    );
  }
}

class ChartDataStruct {
  final DateTime xTitle;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartDataStruct({
    required this.xTitle,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}
