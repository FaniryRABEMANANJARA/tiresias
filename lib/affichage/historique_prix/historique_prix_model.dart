import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'historique_prix_widget.dart' show HistoriquePrixWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriquePrixModel extends FlutterFlowModel<HistoriquePrixWidget> {
  ///  Local state fields for this page.

  ChartDataStruct? historiquePrix;
  void updateHistoriquePrixStruct(Function(ChartDataStruct) updateFn) =>
      updateFn(historiquePrix ??= ChartDataStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
