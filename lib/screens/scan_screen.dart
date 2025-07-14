import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  final String target;
  final String options;
  final String result;
  const ScanScreen({
    super.key,
    required this.target,
    required this.options,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Target: $target',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Options: $options',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            Text('Result:', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8.0),
            Text(result, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
