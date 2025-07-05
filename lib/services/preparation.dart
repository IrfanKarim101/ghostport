import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<String> prepareNmapBinary() async {
  final byteData = await rootBundle.load('assets/nmap-android/nmap');
  final tempDir = await getApplicationDocumentsDirectory();
  final file = File('${tempDir.path}/nmap');

  await file.writeAsBytes(byteData.buffer.asUint8List());
  await Process.run('chmod', ['755', file.path]); // Make executable

  return file.path;
}


Future<String> runNmap(String target) async {
  final nmapPath = await prepareNmapBinary();

  final result = await Process.run(nmapPath, ['-sV', target]);

  if (result.exitCode == 0) {
    return 'Output:\n${result.stdout}';
  } else {
    return 'Error:\n${result.stderr}';
  }
}
