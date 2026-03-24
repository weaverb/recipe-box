import 'package:recipe_box/data/app_database.dart';

/// Pantry coverage score with optional favorite boost (clamped to [0, 1]).
double recipePantryScore({
  required List<int> ingredientIds,
  required Set<int> pantryIngredientIds,
  required bool isFavorite,
}) {
  if (ingredientIds.isEmpty) return 1;
  final available = ingredientIds.where(pantryIngredientIds.contains).length;
  var base = available / ingredientIds.length;
  if (isFavorite) {
    base = (base + 0.15).clamp(0, 1);
  }
  return base;
}

class RankedRecipe {
  RankedRecipe({
    required this.recipe,
    required this.score,
    required this.inPantryCount,
    required this.totalIngredients,
    required this.missingIngredientNames,
  });

  final Recipe recipe;
  final double score;
  final int inPantryCount;
  final int totalIngredients;
  final List<String> missingIngredientNames;
}

/// Ranks recipes by pantry match (favorites get +0.15 before clamp).
Future<List<RankedRecipe>> rankRecipesByPantry(
  AppDatabase db, {
  required Set<int> pantryIngredientIds,
}) async {
  final recipes = await db.select(db.recipes).get();
  final ingredientsById = {
    for (final i in await db.select(db.ingredients).get()) i.id: i,
  };
  final ranked = <RankedRecipe>[];

  for (final r in recipes) {
    final lines = await db.recipeIngredientsFor(r.id);
    final ids = lines.map((l) => l.ingredientId).toList();
    final score = recipePantryScore(
      ingredientIds: ids,
      pantryIngredientIds: pantryIngredientIds,
      isFavorite: r.isFavorite,
    );
    final inPantry = ids.where(pantryIngredientIds.contains).length;
    final missingNames = <String>[];
    for (final line in lines) {
      if (!pantryIngredientIds.contains(line.ingredientId)) {
        final ing = ingredientsById[line.ingredientId];
        if (ing != null) missingNames.add(ing.name);
      }
    }
    missingNames.sort();
    ranked.add(
      RankedRecipe(
        recipe: r,
        score: score,
        inPantryCount: inPantry,
        totalIngredients: ids.length,
        missingIngredientNames: missingNames,
      ),
    );
  }

  ranked.sort((a, b) {
    final byScore = b.score.compareTo(a.score);
    if (byScore != 0) return byScore;
    return a.recipe.title.compareTo(b.recipe.title);
  });
  return ranked;
}
