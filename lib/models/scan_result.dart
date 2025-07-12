class ScanResult {
  final String result;

  ScanResult({required this.result});

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(result: json['result'] ?? '');
  }
}
