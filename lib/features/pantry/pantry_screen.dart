import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/tags.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantry')),
      body: StreamBuilder<List<(PantryItem, Ingredient)>>(
        stream: database.watchPantryWithIngredients(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final rows = snapshot.data ?? [];
          if (rows.isEmpty) {
            return Center(
              child: Text(
                'Pantry is empty.\nAdd what you have on hand.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: rows.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final item = rows[i].$1;
              final ing = rows[i].$2;
              final tags = parseTagsJson(ing.tagsJson);
              return ListTile(
                title: Text(ing.name),
                subtitle: Text(
                  tags.isEmpty
                      ? '${_qty(item)} ${item.unit}'
                      : '${_qty(item)} ${item.unit} · ${tags.join(', ')}',
                ),
                onTap: () => _edit(context, item, ing),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () async {
                    await (database.delete(database.pantryItems)
                          ..where((t) => t.id.equals(item.id)))
                        .go();
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _add(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  String _qty(PantryItem p) {
    final q = p.quantity;
    if (q == q.roundToDouble()) return q.round().toString();
    return q.toString();
  }

  Future<void> _add(BuildContext context) async {
    var ingredients = await database.select(database.ingredients).get();
    ingredients.sort((a, b) => a.name.compareTo(b.name));
    if (!context.mounted) return;
    if (ingredients.isEmpty) {
      await _createIngredientAndPantry(context);
      return;
    }
    final existingPantry = await database.select(database.pantryItems).get();
    if (!context.mounted) return;
    final inPantry = existingPantry.map((e) => e.ingredientId).toSet();
    final choices =
        ingredients.where((i) => !inPantry.contains(i.id)).toList();
    if (choices.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All ingredients are already in pantry')),
      );
      return;
    }
    final picked = await showModalBottomSheet<Ingredient>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(title: Text('Add to pantry')),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: choices.length,
                  itemBuilder: (context, i) {
                    final c = choices[i];
                    return ListTile(
                      title: Text(c.name),
                      onTap: () => Navigator.pop(context, c),
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('New ingredient'),
                onTap: () async {
                  Navigator.pop(context);
                  await _createIngredientAndPantry(context);
                },
              ),
            ],
          ),
        );
      },
    );
    if (picked == null) return;
    if (!context.mounted) return;
    final qty = TextEditingController(text: '1');
    final unit = TextEditingController(text: picked.defaultUnit);
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add ${picked.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qty,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: unit,
              decoration: const InputDecoration(labelText: 'Unit'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    if (!context.mounted) return;
    final q = double.tryParse(qty.text.replaceAll(',', '.')) ?? 1;
    await database.into(database.pantryItems).insert(
          PantryItemsCompanion.insert(
            ingredientId: picked.id,
            quantity: Value(q),
            unit: Value(unit.text.trim()),
          ),
        );
  }

  Future<void> _createIngredientAndPantry(BuildContext context) async {
    final name = TextEditingController();
    final unit = TextEditingController();
    final tags = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create ingredient'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
                autofocus: true,
              ),
              TextField(
                controller: unit,
                decoration: const InputDecoration(labelText: 'Default unit'),
              ),
              TextField(
                controller: tags,
                decoration: const InputDecoration(
                  labelText: 'Tags (comma-separated)',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Create'),
          ),
        ],
      ),
    );
    if (ok != true || name.text.trim().isEmpty) return;
    final tagList = tags.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    final ing = await database.into(database.ingredients).insertReturning(
          IngredientsCompanion.insert(
            name: name.text.trim(),
            defaultUnit: Value(unit.text.trim()),
            tagsJson: Value(encodeTagsJson(tagList)),
          ),
        );
    await database.into(database.pantryItems).insert(
          PantryItemsCompanion.insert(
            ingredientId: ing.id,
            quantity: const Value(1),
            unit: Value(ing.defaultUnit),
          ),
        );
  }

  Future<void> _edit(BuildContext context, PantryItem item, Ingredient ing) async {
    final qty = TextEditingController(
      text: item.quantity == item.quantity.roundToDouble()
          ? item.quantity.round().toString()
          : item.quantity.toString(),
    );
    final unit = TextEditingController(text: item.unit);
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(ing.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qty,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: unit,
              decoration: const InputDecoration(labelText: 'Unit'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    final q = double.tryParse(qty.text.replaceAll(',', '.')) ?? item.quantity;
    await (database.update(database.pantryItems)
          ..where((t) => t.id.equals(item.id)))
        .write(
      PantryItemsCompanion(
        quantity: Value(q),
        unit: Value(unit.text.trim()),
      ),
    );
  }
}
