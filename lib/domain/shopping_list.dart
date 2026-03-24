import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/domain/tags.dart';

class ShoppingLine {
  ShoppingLine({
    required this.ingredientId,
    required this.name,
    required this.amount,
    required this.unit,
    required this.sourceRecipeTitles,
  });

  final int ingredientId;
  final String name;
  final double? amount;
  final String unit;
  final List<String> sourceRecipeTitles;
}

/// Builds a grocery list from all recipes on the meal plan, minus pantry,
/// excluding ingredients whose tags intersect [ignoredTags] (from settings).
Future<List<ShoppingLine>> buildShoppingListFromMealPlan(AppDatabase db) async {
  final prefs = await db.getUserPrefs();
  final ignored = parseTagsJson(prefs?.shoppingIgnoredTagsJson ?? '[]').toSet();

  final planned = await db.allPlannedRecipes();
  final recipeIds = planned.map((e) => e.recipeId).toSet();
  if (recipeIds.isEmpty) return [];

  final pantryRows = await db.select(db.pantryItems).get();
  final pantryIds = pantryRows.map((e) => e.ingredientId).toSet();

  final recipes = await db.select(db.recipes).get();
  final recipeTitle = {for (final r in recipes) r.id: r.title};

  final contributions = <String, List<_Contrib>>{};

  for (final rid in recipeIds) {
    final title = recipeTitle[rid] ?? 'Recipe';
    final lines = await db.recipeIngredientsFor(rid);
    for (final ri in lines) {
      if (pantryIds.contains(ri.ingredientId)) continue;

      final ing = await (db.select(db.ingredients)
            ..where((i) => i.id.equals(ri.ingredientId)))
          .getSingleOrNull();
      if (ing == null) continue;
      if (ingredientHasAnyIgnoredTag(ing, ignored)) continue;

      final key = '${ri.ingredientId}|${ri.unit.trim()}';
      contributions.putIfAbsent(key, () => []).add(
            _Contrib(
              ingredientId: ri.ingredientId,
              name: ing.name,
              amount: ri.amount,
              unit: ri.unit.trim().isEmpty ? ing.defaultUnit : ri.unit.trim(),
              recipeTitle: title,
            ),
          );
    }
  }

  final out = <ShoppingLine>[];
  for (final entry in contributions.entries) {
    final list = entry.value;
    final first = list.first;
    final amounts = list.map((c) => c.amount).whereType<double>().toList();
    double? merged;
    if (amounts.length == list.length && amounts.isNotEmpty) {
      var sum = 0.0;
      for (final x in amounts) {
        sum += x;
      }
      merged = sum;
    }
    final titles = list.map((c) => c.recipeTitle).toSet().toList()..sort();
    out.add(
      ShoppingLine(
        ingredientId: first.ingredientId,
        name: first.name,
        amount: merged,
        unit: first.unit,
        sourceRecipeTitles: titles,
      ),
    );
  }

  out.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  return out;
}

class _Contrib {
  _Contrib({
    required this.ingredientId,
    required this.name,
    required this.amount,
    required this.unit,
    required this.recipeTitle,
  });

  final int ingredientId;
  final String name;
  final double? amount;
  final String unit;
  final String recipeTitle;
}
