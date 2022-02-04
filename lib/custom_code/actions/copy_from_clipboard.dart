// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter/services.dart';

Future<String> copyFromClipboard() async {
  // Add your function code here!
  ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
  return data.text;
}
