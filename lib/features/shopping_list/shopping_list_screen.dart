import 'package:flutter/material.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/shopping_list.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<ShoppingLine>? _lines;
  Object? _error;

  Future<void> _generate() async {
    setState(() {
      _lines = null;
      _error = null;
    });
    try {
      final lines = await buildShoppingListFromMealPlan(widget.database);
      setState(() => _lines = lines);
    } catch (e) {
      setState(() => _error = e);
    }
  }

  @override
  void initState() {
    super.initState();
    _generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping list'),
        actions: [
          IconButton(
            tooltip: 'Refresh from meal plan',
            onPressed: _generate,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    }
    if (_lines == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final lines = _lines!;
    if (lines.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Nothing to buy.\nAdd recipes to your meal plan, or everything is already in your pantry (or ignored by tag in Settings).',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: lines.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final line = lines[i];
        final amt = line.amount != null
            ? (line.amount == line.amount!.roundToDouble()
                ? line.amount!.round().toString()
                : line.amount!.toString())
            : '—';
        final unit = line.unit.isEmpty ? '' : ' ${line.unit}';
        return ListTile(
          title: Text(line.name),
          subtitle: Text(
            'Need: $amt$unit · from ${line.sourceRecipeTitles.join(', ')}',
          ),
        );
      },
    );
  }
}
