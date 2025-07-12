import 'package:flutter/material.dart';
import '../services/nmap_service.dart';
import '../models/scan_result.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _targetController = TextEditingController();
  final _optionsController = TextEditingController(text: '-F -T4');
  String? _output;
  bool _isLoading = false;

  void _runScan() async {
    setState(() {
      _isLoading = true;
      _output = null;
    });

    try {
      final result = await NmapService().runScan(
        target: _targetController.text.trim(),
        options: _optionsController.text.trim(),
      );
      setState(() => _output = result.result);
    } catch (e) {
      setState(() => _output = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nmap Scanner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _targetController,
              decoration: InputDecoration(labelText: 'Target IP / Host'),
            ),
            TextField(
              controller: _optionsController,
              decoration: InputDecoration(labelText: 'Nmap Options'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _runScan,
              child: Text(_isLoading ? 'Scanning...' : 'Run Scan'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_output ?? 'Scan result will appear here'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
