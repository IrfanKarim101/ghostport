import 'dart:convert';
import 'package:ghostport/config/api.dart';
import 'package:http/http.dart' as http;
import '../models/scan_result.dart';


class NmapService {
  static const String baseUrl = Api.baseUrl; 

  Future<ScanResult> runScan({
    required String target,
    required String options,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'target': target,
        'options': options,
      }),
    );

    if (response.statusCode == 200) {
      return ScanResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['error'] ?? 'Scan failed');
    }
  }
}
