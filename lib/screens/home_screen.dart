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

  // Add this for multi-select options
  final Map<String, String> _scanOptions = {
    '-sS': 'SYN Scan',
    '-sU': 'UDP Scan',
    '-sV': 'Service Version Detection',
    '-O': 'OS Detection',
    '-A': 'Aggressive Scan',
    '-Pn': 'No Ping Scan',
    '-p-': 'Scan All Ports',
    '-p 1-65535': 'Scan All Ports (1-65535)',
  };
  final Set<String> _selectedOptions = {};

  bool _isScanning = false; // Add this line

  Future<void> _scanTarget() async {
    String target = _controller.text.trim();
    if (target.isEmpty) return;
    setState(() {
      _isScanning = true;
      _result = '';
    });
    String options = _selectedOptions.join(' ');
    // Simulate scan delay (replace with your actual scan call)
    // String output = await NmapService.runNmap(target, options: options);
    await Future.delayed(const Duration(seconds: 3));// Simulate a scan delay
    setState(() {
      _isScanning = false;
      _result = 'Scan complete!'; // Replace with: output
      
    });
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
            Text(
              'Select scan options (optional):',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Multi-select checkboxes
            ..._scanOptions.entries.map(
              (entry) => CheckboxListTile(
                value: _selectedOptions.contains(entry.key),
                title: Text(entry.value, style: theme.textTheme.bodyMedium),
                onChanged:
                    _isScanning
                        ? null
                        : (selected) {
                          setState(() {
                            if (selected == true) {
                              _selectedOptions.add(entry.key);
                            } else {
                              _selectedOptions.remove(entry.key);
                            }
                          });
                        },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: theme.colorScheme.primary,
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                textStyle: theme.textTheme.bodyLarge,
              ),
              onPressed: _isScanning ? null : _scanTarget,
              child: Text(
                'Scan',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (_isScanning)
              const LinearProgressIndicator(), // <-- Horizontal progress bar
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
