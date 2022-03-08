// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:file_picker/file_picker.dart';

Future<List<String>> fileExplorerUpload() async {
  // Add your function code here!
  FilePickerResult result = await FilePicker.platform.pickFiles();

  if (result != null) {
    //File file = File(result.files.single.path);
    PlatformFile file = result.files.first;
    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);
    return [
      file.name,
      file.path.toString(),
      file.size.toString(),
      file.extension.toString()
    ];
  } else {
    // User canceled the picker
  }
}
