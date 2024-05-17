// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChartDataStruct extends FFFirebaseStruct {
  ChartDataStruct({
    String? xTitle,
    int? yValue1,
    int? yValue2,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xTitle = xTitle,
        _yValue1 = yValue1,
        _yValue2 = yValue2,
        _date = date,
        super(firestoreUtilData);

  // "xTitle" field.
  String? _xTitle;
  String get xTitle => _xTitle ?? '';
  set xTitle(String? val) => _xTitle = val;
  bool hasXTitle() => _xTitle != null;

  // "yValue1" field.
  int? _yValue1;
  int get yValue1 => _yValue1 ?? 0;
  set yValue1(int? val) => _yValue1 = val;
  void incrementYValue1(int amount) => _yValue1 = yValue1 + amount;
  bool hasYValue1() => _yValue1 != null;

  // "yValue2" field.
  int? _yValue2;
  int get yValue2 => _yValue2 ?? 0;
  set yValue2(int? val) => _yValue2 = val;
  void incrementYValue2(int amount) => _yValue2 = yValue2 + amount;
  bool hasYValue2() => _yValue2 != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static ChartDataStruct fromMap(Map<String, dynamic> data) => ChartDataStruct(
        xTitle: data['xTitle'] as String?,
        yValue1: castToType<int>(data['yValue1']),
        yValue2: castToType<int>(data['yValue2']),
        date: data['date'] as DateTime?,
      );

  static ChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'xTitle': _xTitle,
        'yValue1': _yValue1,
        'yValue2': _yValue2,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xTitle': serializeParam(
          _xTitle,
          ParamType.String,
        ),
        'yValue1': serializeParam(
          _yValue1,
          ParamType.int,
        ),
        'yValue2': serializeParam(
          _yValue2,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartDataStruct(
        xTitle: deserializeParam(
          data['xTitle'],
          ParamType.String,
          false,
        ),
        yValue1: deserializeParam(
          data['yValue1'],
          ParamType.int,
          false,
        ),
        yValue2: deserializeParam(
          data['yValue2'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartDataStruct &&
        xTitle == other.xTitle &&
        yValue1 == other.yValue1 &&
        yValue2 == other.yValue2 &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([xTitle, yValue1, yValue2, date]);
}

ChartDataStruct createChartDataStruct({
  String? xTitle,
  int? yValue1,
  int? yValue2,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChartDataStruct(
      xTitle: xTitle,
      yValue1: yValue1,
      yValue2: yValue2,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChartDataStruct? updateChartDataStruct(
  ChartDataStruct? chartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChartDataStructData(
  Map<String, dynamic> firestoreData,
  ChartDataStruct? chartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chartData == null) {
    return;
  }
  if (chartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chartDataData = getChartDataFirestoreData(chartData, forFieldValue);
  final nestedData = chartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChartDataFirestoreData(
  ChartDataStruct? chartData, [
  bool forFieldValue = false,
]) {
  if (chartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chartData.toMap());

  // Add any Firestore field values
  chartData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChartDataListFirestoreData(
  List<ChartDataStruct>? chartDatas,
) =>
    chartDatas?.map((e) => getChartDataFirestoreData(e, true)).toList() ?? [];
