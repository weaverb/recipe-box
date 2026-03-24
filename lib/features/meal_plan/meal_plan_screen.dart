import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recipe_box/core/date_utils.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/meal_planner.dart';

class _SlotVm {
  _SlotVm({required this.slot, required this.recipes, required this.linkIds});

  final MealPlanSlot slot;
  final List<Recipe> recipes;
  /// Parallel to [recipes]: meal_plan_slot_recipes.id for removal
  final List<int> linkIds;
}

class _DayVm {
  _DayVm({required this.epochDay, required this.dayId, required this.slots});

  final int epochDay;
  final int? dayId;
  final List<_SlotVm> slots;
}

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  late DateTime _weekStart;
  int _reloadKey = 0;

  @override
  void initState() {
    super.initState();
    _weekStart = _monday(DateTime.now());
  }

  DateTime _monday(DateTime d) {
    final local = dateOnlyLocal(d);
    return local.subtract(Duration(days: local.weekday - DateTime.monday));
  }

  void _bump() => setState(() => _reloadKey++);

  Future<int> _ensureDayId(int epochDay) async {
    final existing = await (widget.database.select(widget.database.mealPlanDays)
          ..where((d) => d.epochDay.equals(epochDay)))
        .getSingleOrNull();
    if (existing != null) return existing.id;
    final row = await widget.database
        .into(widget.database.mealPlanDays)
        .insertReturning(
          MealPlanDaysCompanion.insert(epochDay: epochDay),
        );
    return row.id;
  }

  Future<List<_DayVm>> _loadWeek() async {
    final out = <_DayVm>[];
    for (var i = 0; i < 7; i++) {
      final date = _weekStart.add(Duration(days: i));
      final ed = epochDayFromDate(date);
      final dayRow = await (widget.database.select(widget.database.mealPlanDays)
            ..where((d) => d.epochDay.equals(ed)))
          .getSingleOrNull();
      if (dayRow == null) {
        out.add(_DayVm(epochDay: ed, dayId: null, slots: []));
        continue;
      }
      final slots = await (widget.database.select(widget.database.mealPlanSlots)
            ..where((s) => s.dayId.equals(dayRow.id))
            ..orderBy([(s) => OrderingTerm.asc(s.name)]))
          .get();
      final slotVms = <_SlotVm>[];
      for (final sl in slots) {
        final links = await (widget.database
                .select(widget.database.mealPlanSlotRecipes)
              ..where((r) => r.slotId.equals(sl.id)))
            .get();
        final recipes = <Recipe>[];
        final linkIds = <int>[];
        for (final l in links) {
          final r = await (widget.database.select(widget.database.recipes)
                ..where((x) => x.id.equals(l.recipeId)))
              .getSingleOrNull();
          if (r != null) {
            recipes.add(r);
            linkIds.add(l.id);
          }
        }
        slotVms.add(_SlotVm(slot: sl, recipes: recipes, linkIds: linkIds));
      }
      out.add(_DayVm(epochDay: ed, dayId: dayRow.id, slots: slotVms));
    }
    return out;
  }

  Future<({List<_DayVm> days, List<RankedRecipe> ranked})> _loadAll() async {
    final days = await _loadWeek();
    final pantryRows =
        await widget.database.select(widget.database.pantryItems).get();
    final pantryIds = pantryRows.map((e) => e.ingredientId).toSet();
    final ranked = await rankRecipesByPantry(
      widget.database,
      pantryIngredientIds: pantryIds,
    );
    return (days: days, ranked: ranked);
  }

  Future<void> _addSlot(int epochDay) async {
    final name = TextEditingController(text: 'Dinner');
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Meal name'),
        content: TextField(
          controller: name,
          decoration: const InputDecoration(hintText: 'Breakfast, Lunch, …'),
          autofocus: true,
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
    if (ok != true || name.text.trim().isEmpty) return;
    final dayId = await _ensureDayId(epochDay);
    await widget.database.into(widget.database.mealPlanSlots).insert(
          MealPlanSlotsCompanion.insert(
            dayId: dayId,
            name: name.text.trim(),
          ),
        );
    _bump();
  }

  Future<void> _addRecipeToSlot(MealPlanSlot slot) async {
    var recipes = await widget.database.select(widget.database.recipes).get();
    recipes.sort((a, b) => a.title.compareTo(b.title));
    if (!mounted) return;
    if (recipes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Create a recipe first')),
      );
      return;
    }
    final picked = await showModalBottomSheet<Recipe>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, i) {
            final r = recipes[i];
            return ListTile(
              title: Text(r.title),
              leading: Icon(
                r.isFavorite ? Icons.star : Icons.restaurant_menu,
              ),
              onTap: () => Navigator.pop(context, r),
            );
          },
        ),
      ),
    );
    if (picked == null) return;
    await widget.database.into(widget.database.mealPlanSlotRecipes).insert(
          MealPlanSlotRecipesCompanion.insert(
            slotId: slot.id,
            recipeId: picked.id,
          ),
        );
    _bump();
  }

  Future<void> _removeRecipeFromSlot(int linkId) async {
    await (widget.database.delete(widget.database.mealPlanSlotRecipes)
          ..where((r) => r.id.equals(linkId)))
        .go();
    _bump();
  }

  Future<void> _deleteSlot(MealPlanSlot slot) async {
    await (widget.database.delete(widget.database.mealPlanSlots)
          ..where((s) => s.id.equals(slot.id)))
        .go();
    _bump();
  }

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.MMMd();
    final wd = DateFormat.E();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal plan'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _weekStart = _weekStart.subtract(const Duration(days: 7));
                    });
                    _bump();
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(
                  '${df.format(_weekStart)} – ${df.format(_weekStart.add(const Duration(days: 6)))}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _weekStart = _weekStart.add(const Duration(days: 7));
                    });
                    _bump();
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<({List<_DayVm> days, List<RankedRecipe> ranked})>(
        key: ValueKey(_reloadKey),
        future: _loadAll(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('${snap.error}'));
          }
          final data = snap.data!;
          final days = data.days;
          final ranked = data.ranked;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final day = days[index];
                      final date = dateFromEpochDay(day.epochDay);
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    wd.format(date),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    df.format(date),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  ),
                                  const Spacer(),
                                  TextButton.icon(
                                    onPressed: () => _addSlot(day.epochDay),
                                    icon: const Icon(Icons.add, size: 18),
                                    label: const Text('Meal'),
                                  ),
                                ],
                              ),
                              if (day.slots.isEmpty)
                                Text(
                                  'No meals yet.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                              ...day.slots.map((sv) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            sv.slot.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            tooltip: 'Add recipe',
                                            icon: const Icon(Icons.add_circle_outline),
                                            onPressed: () =>
                                                _addRecipeToSlot(sv.slot),
                                          ),
                                          IconButton(
                                            tooltip: 'Remove meal slot',
                                            icon: const Icon(Icons.delete_outline),
                                            onPressed: () =>
                                                _deleteSlot(sv.slot),
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          for (var j = 0;
                                              j < sv.recipes.length;
                                              j++)
                                            InputChip(
                                              label: Text(sv.recipes[j].title),
                                              deleteIcon:
                                                  const Icon(Icons.close, size: 18),
                                              onDeleted: () =>
                                                  _removeRecipeFromSlot(
                                                sv.linkIds[j],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: days.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Text(
                    'Suggestions (pantry match)',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final r = ranked[index];
                      final pct = (r.score * 100).round();
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ExpansionTile(
                          title: Text(r.recipe.title),
                          subtitle: Text(
                            '$pct% match · ${r.inPantryCount}/${r.totalIngredients} in pantry'
                            '${r.recipe.isFavorite ? ' · Favorite' : ''}',
                          ),
                          children: [
                            if (r.missingIngredientNames.isEmpty)
                              const ListTile(
                                title: Text('All ingredients in pantry'),
                              )
                            else
                              ListTile(
                                title: const Text('Missing from pantry'),
                                subtitle: Text(
                                  r.missingIngredientNames.join(', '),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    childCount: ranked.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
