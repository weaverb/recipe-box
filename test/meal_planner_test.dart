import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_box/domain/meal_planner.dart';

void main() {
  test('recipePantryScore favors favorites with clamp', () {
    const ids = [1, 2, 3, 4];
    final pantry = {1, 2};
    final base = recipePantryScore(
      ingredientIds: ids,
      pantryIngredientIds: pantry,
      isFavorite: false,
    );
    final fav = recipePantryScore(
      ingredientIds: ids,
      pantryIngredientIds: pantry,
      isFavorite: true,
    );
    expect(base, 0.5);
    expect(fav, 0.65);
    expect(
      recipePantryScore(
        ingredientIds: ids,
        pantryIngredientIds: {1, 2, 3, 4},
        isFavorite: true,
      ),
      1.0,
    );
  });
}
