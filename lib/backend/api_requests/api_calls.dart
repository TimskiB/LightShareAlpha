import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetInfoCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getInfo',
      apiUrl: 'http://172.105.64.85:5555/info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic math(dynamic response) => getJsonField(
        response,
        r'''$.data.math''',
      );
  static dynamic requests(dynamic response) => getJsonField(
        response,
        r'''$.data.requests''',
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data.time''',
      );
}

class TestConnectionCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'TestConnection',
      apiUrl: 'http://172.105.64.85:5555/test',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic test(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}
