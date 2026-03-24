import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get defaultUnit => text().withDefault(const Constant(''))();
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();
}

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get instructions => text().withDefault(const Constant(''))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class RecipeIngredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  IntColumn get ingredientId => integer().references(Ingredients, #id)();
  RealColumn get amount => real().nullable()();
  TextColumn get unit => text().withDefault(const Constant(''))();
  TextColumn get note => text().nullable()();
}

class PantryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get ingredientId =>
      integer().references(Ingredients, #id, onDelete: KeyAction.cascade)();
  RealColumn get quantity => real().withDefault(const Constant(1))();
  TextColumn get unit => text().withDefault(const Constant(''))();
}

class MealPlanDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get epochDay => integer().unique()();
}

class MealPlanSlots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dayId =>
      integer().references(MealPlanDays, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
}

class MealPlanSlotRecipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get slotId =>
      integer().references(MealPlanSlots, #id, onDelete: KeyAction.cascade)();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
}

class UserPrefs extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get shoppingIgnoredTagsJson =>
      text().withDefault(const Constant('[]'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Ingredients,
    Recipes,
    RecipeIngredients,
    PantryItems,
    MealPlanDays,
    MealPlanSlots,
    MealPlanSlotRecipes,
    UserPrefs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'recipe_box');
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await into(userPrefs).insert(const UserPrefsCompanion(
            id: Value(1),
            shoppingIgnoredTagsJson: Value('[]'),
          ));
        },
      );

  Future<UserPref?> getUserPrefs() =>
      (select(userPrefs)..where((t) => t.id.equals(1))).getSingleOrNull();

  Future<void> setShoppingIgnoredTagsJson(String json) async {
    await into(userPrefs).insertOnConflictUpdate(
      UserPrefsCompanion(
        id: const Value(1),
        shoppingIgnoredTagsJson: Value(json),
      ),
    );
  }

  Stream<List<Recipe>> watchRecipesOrdered() {
    return (select(recipes)..orderBy([(t) => OrderingTerm(expression: t.title)]))
        .watch();
  }

  Stream<List<Ingredient>> watchIngredientsOrdered() {
    return (select(ingredients)..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  /// Pantry rows with resolved ingredient for display.
  Stream<List<(PantryItem, Ingredient)>> watchPantryWithIngredients() {
    final query = select(pantryItems).join([
      innerJoin(
        ingredients,
        ingredients.id.equalsExp(pantryItems.ingredientId),
      ),
    ])..orderBy([OrderingTerm.asc(ingredients.name)]);

    return query.watch().map(
          (rows) => rows
              .map(
                (r) => (
                  r.readTable(pantryItems),
                  r.readTable(ingredients),
                ),
              )
              .toList(),
        );
  }

  Future<List<RecipeIngredient>> recipeIngredientsFor(int recipeId) {
    return (select(recipeIngredients)
          ..where((ri) => ri.recipeId.equals(recipeId)))
        .get();
  }

  Future<List<MealPlanSlotRecipe>> allPlannedRecipes() async {
    final q = select(mealPlanSlotRecipes).join([
      innerJoin(
        mealPlanSlots,
        mealPlanSlots.id.equalsExp(mealPlanSlotRecipes.slotId),
      ),
      innerJoin(
        mealPlanDays,
        mealPlanDays.id.equalsExp(mealPlanSlots.dayId),
      ),
    ])
      ..orderBy([
        OrderingTerm.asc(mealPlanDays.epochDay),
        OrderingTerm.asc(mealPlanSlots.name),
      ]);

    final rows = await q.get();
    return rows.map((r) => r.readTable(mealPlanSlotRecipes)).toList();
  }
}
