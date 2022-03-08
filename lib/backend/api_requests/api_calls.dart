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

class CheckUserCall {
  static Future<ApiCallResponse> call({
    String userId = 'myveryspecialid123',
    String userName = 'Timski',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'checkUser',
      apiUrl: 'http://172.105.64.85:5555/user?uid=${userId}&name=${userName}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic devices(dynamic response) => getJsonField(
        response,
        r'''$.devices''',
      );
}

class GetUidCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getUid',
      apiUrl: 'http://172.105.64.85:5555/uid-collector',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic uidpath(dynamic response) => getJsonField(
        response,
        r'''$.uid''',
      );
}

class GetDevicesCall {
  static Future<ApiCallResponse> call({
    String userId = 'myveryspecialid123',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getDevices',
      apiUrl: 'http://172.105.64.85:5555/${userId}/devices',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic devices(dynamic response) => getJsonField(
        response,
        r'''$.devices''',
      );
}

class AddUpdateDeviceCall {
  static Future<ApiCallResponse> call({
    String userId = 'default-id-ff',
    String deviceId = 'default-id-ff',
    String description = 'No given description.',
    String name = 'Default-name-ff',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'AddUpdateDevice',
      apiUrl:
          'http://172.105.64.85:5555/${userId}/devices/${deviceId}?description=${description}&name=${name}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class GetAllFilesCall {
  static Future<ApiCallResponse> call({
    String userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllFiles',
      apiUrl: 'http://172.105.64.85:5555/storage/${userId}/files',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class AddFIleCall {
  static Future<ApiCallResponse> call({
    String fileName = '',
    String userId = '',
    double fileSize,
    String fileType = '',
  }) {
    final body = '''
--MultiPart
Content-Disposition: form-data; name="aFile"; filename="${fileName}"
Content-Type: "${fileType}"

''';
    return ApiManager.instance.makeApiCall(
      callName: 'addFIle',
      apiUrl:
          'http://172.105.64.85:5555/storage/${userId}/add?name=${fileName}&type=${fileType}&size=${fileSize}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data; boundary=MultiPart',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
    );
  }
}

class FilesInfoCall {
  static Future<ApiCallResponse> call({
    String userId = 'default',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'FilesInfo',
      apiUrl: 'http://172.105.64.85:5555/storage/${userId}/info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
