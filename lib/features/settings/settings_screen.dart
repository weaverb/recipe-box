import 'package:flutter/material.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/tags.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _controller = TextEditingController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await widget.database.getUserPrefs();
    final tags = parseTagsJson(prefs?.shoppingIgnoredTagsJson ?? '[]');
    _controller.text = tags.join(', ');
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final raw = _controller.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    await widget.database
        .setShoppingIgnoredTagsJson(encodeTagsJson(raw));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved ignored tags')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Shopping list',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Ingredients with any of these tags are still used for meal-plan matching, '
            'but are not added to the generated shopping list (e.g. spice).',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Ignored tags (comma-separated)',
              hintText: 'spice, staple',
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
