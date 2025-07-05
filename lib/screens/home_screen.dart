import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:ghostport/services/preparation.dart' as NmapService;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  Future<void> _scanTarget() async {
    String target = _controller.text.trim();
    if (target.isEmpty) return;

    setState(() => _result = 'Scanning...');
    String output = await NmapService.runNmap(target);
    setState(() => _result = output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nmap Scanner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter IP or domain',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanTarget,
              child: const Text('Scan'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_result),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
