import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/tags.dart';

class _LineDraft {
  _LineDraft({this.dbId, required this.ingredientId});

  int? dbId;
  int ingredientId;
  final TextEditingController amount = TextEditingController();
  final TextEditingController unit = TextEditingController();
  final TextEditingController note = TextEditingController();

  void dispose() {
    amount.dispose();
    unit.dispose();
    note.dispose();
  }
}

class RecipeEditorScreen extends StatefulWidget {
  const RecipeEditorScreen({super.key, required this.database, this.recipeId});

  final AppDatabase database;
  final int? recipeId;

  @override
  State<RecipeEditorScreen> createState() => _RecipeEditorScreenState();
}

class _RecipeEditorScreenState extends State<RecipeEditorScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _instructions = TextEditingController();
  bool _favorite = false;
  bool _loading = true;
  final _lines = <_LineDraft>[];
  List<Ingredient> _ingredients = [];

  bool get _isNew => widget.recipeId == null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final loaded =
        await widget.database.select(widget.database.ingredients).get();
    loaded.sort((a, b) => a.name.compareTo(b.name));
    _ingredients = loaded;

    if (widget.recipeId != null) {
      final r = await (widget.database.select(widget.database.recipes)
            ..where((t) => t.id.equals(widget.recipeId!)))
          .getSingleOrNull();
      if (r != null) {
        _title.text = r.title;
        _description.text = r.description ?? '';
        _instructions.text = r.instructions;
        _favorite = r.isFavorite;
        final ris = await widget.database.recipeIngredientsFor(r.id);
        for (final ri in ris) {
          final d = _LineDraft(
            dbId: ri.id,
            ingredientId: ri.ingredientId,
          );
          if (ri.amount != null) d.amount.text = _fmtNum(ri.amount!);
          d.unit.text = ri.unit;
          d.note.text = ri.note ?? '';
          _lines.add(d);
        }
      }
    }

    setState(() => _loading = false);
  }

  String _fmtNum(double n) {
    if (n == n.roundToDouble()) return n.round().toString();
    return n.toString();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _instructions.dispose();
    for (final l in _lines) {
      l.dispose();
    }
    super.dispose();
  }

  Future<void> _pickIngredient(_LineDraft line) async {
    final chosen = await showModalBottomSheet<Ingredient>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.55,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          builder: (context, scroll) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Choose ingredient'),
                ),
                Expanded(
                  child: _IngredientPickerList(
                    ingredients: _ingredients,
                    scrollController: scroll,
                    onSelect: (ing) => Navigator.pop(context, ing),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('New ingredient'),
                  onTap: () async {
                    final created = await _showCreateIngredientDialog();
                    if (created != null && context.mounted) {
                      Navigator.pop(context, created);
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
    if (chosen != null) {
      setState(() {
        line.ingredientId = chosen.id;
        if (line.unit.text.isEmpty) {
          line.unit.text = chosen.defaultUnit;
        }
      });
    }
  }

  Future<Ingredient?> _showCreateIngredientDialog() async {
    final name = TextEditingController();
    final unit = TextEditingController();
    final tags = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New ingredient'),
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
                decoration: const InputDecoration(
                  labelText: 'Default unit',
                  hintText: 'e.g. g, ml, whole',
                ),
              ),
              TextField(
                controller: tags,
                decoration: const InputDecoration(
                  labelText: 'Tags (comma-separated)',
                  hintText: 'spice, staple',
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
    if (ok != true || name.text.trim().isEmpty) return null;
    final tagList = tags.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    final ing = await widget.database
        .into(widget.database.ingredients)
        .insertReturning(
          IngredientsCompanion.insert(
            name: name.text.trim(),
            defaultUnit: Value(unit.text.trim()),
            tagsJson: Value(encodeTagsJson(tagList)),
          ),
        );
    final again =
        await widget.database.select(widget.database.ingredients).get();
    again.sort((a, b) => a.name.compareTo(b.name));
    _ingredients = again;
    return ing;
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title is required')),
      );
      return;
    }

    await widget.database.transaction(() async {
      final rid = widget.recipeId;
      int recipeRowId;
      if (rid == null) {
        final row = await widget.database.into(widget.database.recipes).insertReturning(
              RecipesCompanion.insert(
                title: title,
                description: Value(_description.text.trim().isEmpty
                    ? null
                    : _description.text.trim()),
                instructions: Value(_instructions.text),
                isFavorite: Value(_favorite),
              ),
            );
        recipeRowId = row.id;
      } else {
        recipeRowId = rid;
        await (widget.database.update(widget.database.recipes)
              ..where((t) => t.id.equals(rid)))
            .write(
          RecipesCompanion(
            title: Value(title),
            description: Value(_description.text.trim().isEmpty
                ? null
                : _description.text.trim()),
            instructions: Value(_instructions.text),
            isFavorite: Value(_favorite),
          ),
        );
        await (widget.database.delete(widget.database.recipeIngredients)
              ..where((ri) => ri.recipeId.equals(recipeRowId)))
            .go();
      }

      for (final line in _lines) {
        double? amt;
        final a = line.amount.text.trim();
        if (a.isNotEmpty) {
          amt = double.tryParse(a.replaceAll(',', '.'));
        }
        await widget.database.into(widget.database.recipeIngredients).insert(
              RecipeIngredientsCompanion.insert(
                recipeId: recipeRowId,
                ingredientId: line.ingredientId,
                amount: Value(amt),
                unit: Value(line.unit.text.trim()),
                note: Value(line.note.text.trim().isEmpty
                    ? null
                    : line.note.text.trim()),
              ),
            );
      }
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved')),
      );
      context.pop();
    }
  }

  Future<void> _delete() async {
    final id = widget.recipeId;
    if (id == null) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete recipe?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok == true) {
      await (widget.database.delete(widget.database.recipes)
            ..where((t) => t.id.equals(id)))
          .go();
      if (mounted) context.pop();
    }
  }

  String _ingredientName(int id) {
    for (final i in _ingredients) {
      if (i.id == id) return i.name;
    }
    return 'Ingredient #$id';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isNew ? 'New recipe' : 'Edit recipe'),
        actions: [
          if (!_isNew)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _delete,
            ),
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _title,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _description,
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Favorite (meal planning boost)'),
            value: _favorite,
            onChanged: (v) => setState(() => _favorite = v),
          ),
          const SizedBox(height: 12),
          Text('Instructions', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          TextField(
            controller: _instructions,
            decoration: const InputDecoration(
              hintText: 'Steps, one per line',
              alignLabelWithHint: true,
            ),
            maxLines: 10,
            minLines: 4,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text('Ingredients', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              FilledButton.tonalIcon(
                onPressed: () {
                  if (_ingredients.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Create an ingredient first (use + on Pantry or here)'),
                      ),
                    );
                    return;
                  }
                  setState(() {
                    _lines.add(
                      _LineDraft(ingredientId: _ingredients.first.id),
                    );
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add line'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_lines.isEmpty)
            Text(
              'No ingredients linked. Add lines to connect pantry and shopping list.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ..._lines.map((line) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(_ingredientName(line.ingredientId)),
                      subtitle: const Text('Tap to change ingredient'),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            line.dispose();
                            _lines.remove(line);
                          });
                        },
                      ),
                      onTap: () => _pickIngredient(line),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: line.amount,
                            decoration: const InputDecoration(
                              labelText: 'Amount',
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: line.unit,
                            decoration: const InputDecoration(
                              labelText: 'Unit',
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: line.note,
                      decoration: const InputDecoration(labelText: 'Note'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _IngredientPickerList extends StatefulWidget {
  const _IngredientPickerList({
    required this.ingredients,
    required this.scrollController,
    required this.onSelect,
  });

  final List<Ingredient> ingredients;
  final ScrollController scrollController;
  final void Function(Ingredient) onSelect;

  @override
  State<_IngredientPickerList> createState() => _IngredientPickerListState();
}

class _IngredientPickerListState extends State<_IngredientPickerList> {
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    final q = _filter.toLowerCase();
    final list = widget.ingredients
        .where((i) => q.isEmpty || i.name.toLowerCase().contains(q))
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Filter ingredients',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (v) => setState(() => _filter = v),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: list.length,
            itemBuilder: (context, i) {
              final ing = list[i];
              return ListTile(
                title: Text(ing.name),
                subtitle: parseTagsJson(ing.tagsJson).isEmpty
                    ? null
                    : Text(parseTagsJson(ing.tagsJson).join(', ')),
                onTap: () => widget.onSelect(ing),
              );
            },
          ),
        ),
      ],
    );
  }
}
