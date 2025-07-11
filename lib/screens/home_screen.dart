import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ghostport/services/theme_services.dart';
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
    final themeService = Provider.of<ThemeService>(context);
    final isDark = themeService.isDarkMode;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Port Scanner'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: () => themeService.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter IP or domain',
                labelStyle: theme.inputDecorationTheme.labelStyle,
                border: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
              ),
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            //OPTIONAL: Add a dropdown for scan OPTIONS SPECIFIC TO NMAP WITH A LITTLE DESCRIPTION
            Text(
              'Select scan options (optional):',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'default', child: Text('Default Scan')),
                DropdownMenuItem(value: '-sS', child: Text('SYN Scan')),
                DropdownMenuItem(value: '-sU', child: Text('UDP Scan')),
                DropdownMenuItem(
                  value: '-sV',
                  child: Text('Service Version Detection'),
                ),
                DropdownMenuItem(value: '-O', child: Text('OS Detection')),
                DropdownMenuItem(value: '-A', child: Text('Aggressive Scan')),
                DropdownMenuItem(value: '-Pn', child: Text('No Ping Scan')),
                DropdownMenuItem(value: '-p-', child: Text('Scan All Ports')),
                DropdownMenuItem(
                  value: '-p 1-65535',
                  child: Text('Scan All Ports (1-65535)'),
                ),
              ],
              onChanged: (value) {
                // Handle scan option change if needed
                
              },
              decoration: InputDecoration(
                border: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                textStyle: theme.textTheme.bodyLarge,
              ),
              onPressed: _scanTarget,
              child: Text(
                'Scan',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_result, style: theme.textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
