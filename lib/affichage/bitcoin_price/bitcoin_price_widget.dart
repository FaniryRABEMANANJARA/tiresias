import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bitcoin_price_model.dart';
export 'bitcoin_price_model.dart';

class BitcoinPriceWidget extends StatefulWidget {
  const BitcoinPriceWidget({super.key});

  @override
  State<BitcoinPriceWidget> createState() => _BitcoinPriceWidgetState();
}

class _BitcoinPriceWidgetState extends State<BitcoinPriceWidget> {
  late BitcoinPriceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BitcoinPriceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToChartData(ChartDataStruct(
          xTitle: 'Jan',
          yValue1: 30000,
          yValue2: 20000,
        ));
      });
      setState(() {
        _model.addToChartData(ChartDataStruct(
          xTitle: 'Fev',
          yValue1: 10000,
          yValue2: 50000,
        ));
      });
      setState(() {
        _model.addToChartData(ChartDataStruct(
          xTitle: 'Mars',
          yValue1: 60000,
          yValue2: 40000,
        ));
      });
      setState(() {
        _model.addToChartData(ChartDataStruct(
          xTitle: 'Avr',
          yValue1: 30500,
          yValue2: 66000,
        ));
      });
      setState(() {
        _model.addToChartData(ChartDataStruct(
          xTitle: 'Mai',
          yValue1: 62000,
          yValue2: 50000,
        ));
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF191970),
        appBar: AppBar(
          backgroundColor: Color(0xFF191970),
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'ml7kkj9e' /* Cours du bitcoin */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 32.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '0iip5de2' /* Le prix actuel du bitcoin n'es... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      'me39i3pu' /* Actualiser */,
                    ),
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 320.0,
                          height: 500.0,
                          child: custom_widgets.ColumnChart(
                            width: 320.0,
                            height: 500.0,
                            chartData: _model.chartData,
                            chartTitle: 'BitCoin 2024',
                            date: getCurrentTimestamp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
