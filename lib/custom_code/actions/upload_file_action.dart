// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:http/http.dart' as http;

Future<String> uploadFileAction(List<String> fileData, String userId) async {
  // Add your function code here!

  String name = fileData[0];
  String path = fileData[1];
  String size = fileData[2];
  String fExtension = fileData[3];

  var request = http.MultipartRequest(
    "POST",
    Uri.parse(
        "http://172.105.64.85:5555/storage/$userId/add?name=$name&type=$fExtension&size=$size"),
  );

  request.files.add(
    await http.MultipartFile.fromPath(
      'file', path,
      //  contentType: MediaType('application', 'octet-stream'),
      filename: name,
    ),
  );
  request.send().then((response) {
    if (response.statusCode == 200) {
      print("Uploaded!");
      return "File Uploaded!";
    }
  });
  return "Upload Failed";
}
