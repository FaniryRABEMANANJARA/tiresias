import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'bitcoin_price_widget.dart' show BitcoinPriceWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BitcoinPriceModel extends FlutterFlowModel<BitcoinPriceWidget> {
  ///  Local state fields for this page.

  List<ChartDataStruct> chartData = [];
  void addToChartData(ChartDataStruct item) => chartData.add(item);
  void removeFromChartData(ChartDataStruct item) => chartData.remove(item);
  void removeAtIndexFromChartData(int index) => chartData.removeAt(index);
  void insertAtIndexInChartData(int index, ChartDataStruct item) =>
      chartData.insert(index, item);
  void updateChartDataAtIndex(int index, Function(ChartDataStruct) updateFn) =>
      chartData[index] = updateFn(chartData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
