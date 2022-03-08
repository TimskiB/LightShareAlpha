// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getUid() async {
  String url = "http://172.105.64.85:5555/uid-collector";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var content = json.decode(response.body);
    return content["uid"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    //throw Exception('Failed to load album');
    return "ERROR_RECV";
  }
}
