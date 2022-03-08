// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code

Future<String> shareMain(
  List<DevicesRecord> devices,
  List<ConversationsRecord> conversations,
) async {
  // Add your function code here!
  String result = "Sharing with: ";
  devices.forEach((device) {
    if (device.checkbox == true) {
      result = result + device.name;
    }
  });
  conversations.forEach((c) {
    if (c.checkbox == true) {
      result = result + c.name;
    }
  });
  return result;
}
