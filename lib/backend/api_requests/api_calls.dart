import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApiUSDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiUSD',
      apiUrl:
          'https://v6.exchangerate-api.com/v6/2ef6a82e850a04e540b31421/latest/USD',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? conversionrates(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$..conversion_rates.EUR''',
      ));
  static String? timelastupdateutc(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..time_last_update_utc''',
      ));
  static String? timenextupdateutc(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..time_next_update_utc''',
      ));
  static double? conversionratesAED(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$..conversion_rates.AED''',
      ));
}

class ApiEURCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiEUR',
      apiUrl:
          'https://v6.exchangerate-api.com/v6/2ef6a82e850a04e540b31421/latest/EUR',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? conversionrates(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$..conversion_rates.USD''',
      ));
  static String? timelastupdateutc(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..time_last_update_utc''',
      ));
  static String? timenextupdateutc(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..time_next_update_utc''',
      ));
  static double? conversionratesAED(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$..conversion_rates.AED''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
