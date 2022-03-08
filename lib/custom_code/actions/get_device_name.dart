// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

Future<String> getDeviceName() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    print(info.toMap());
    return info.device.toString();
  } else if (Platform.isIOS) {
    IosDeviceInfo info = await deviceInfo.iosInfo;
    print(info.toMap());
    return info.name.toString();
  } else if (Platform.isLinux) {
    LinuxDeviceInfo info = await deviceInfo.linuxInfo;
    print(info.toMap());
    return info.name.toString();
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo info = await deviceInfo.macOsInfo;
    print(info.toMap());
    return info.model.toString();
  } else if (Platform.isWindows) {
    WindowsDeviceInfo info = await deviceInfo.windowsInfo;
    print(info.toMap());
    return info.computerName.toString();
  }

  final info = await deviceInfo.deviceInfo;
  print(info.toMap());
  return "Unknown";
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.codename': build.version.codename,
    'id': build.id,
    'model': build.model,
    'androidId': build.androidId,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'identifierForVendor': data.identifierForVendor,
  };
}

Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'id': data.id,
    'prettyName': data.prettyName,
    'buildId': data.buildId,
    'machineId': data.machineId,
  };
}

Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  return <String, dynamic>{
    'browserName': describeEnum(data.browserName),
    'appCodeName': data.appCodeName,
    'appName': data.appName,
    'platform': data.platform,
  };
}

Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  return <String, dynamic>{
    'computerName': data.computerName,
    'hostName': data.hostName,
    'model': data.model,
  };
}

Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  return <String, dynamic>{'computerName': data.computerName};
}
