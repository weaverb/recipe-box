import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_box/core/breakpoints.dart';
import 'package:recipe_box/core/shell_scaffold.dart';
import 'package:recipe_box/data/app_database.dart';
import 'package:recipe_box/features/meal_plan/meal_plan_screen.dart';
import 'package:recipe_box/features/pantry/pantry_screen.dart';
import 'package:recipe_box/features/recipes/recipe_editor_screen.dart';
import 'package:recipe_box/features/recipes/recipes_list_screen.dart';
import 'package:recipe_box/features/settings/settings_screen.dart';
import 'package:recipe_box/features/shopping_list/shopping_list_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter(AppDatabase db) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/recipes',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScaffold(
            navigationShell: navigationShell,
            compact: isCompactWidth(context),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/recipes',
                builder: (context, state) => RecipesListScreen(database: db),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/pantry',
                builder: (context, state) => PantryScreen(database: db),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/meal-plan',
                builder: (context, state) => MealPlanScreen(database: db),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/shopping',
                builder: (context, state) => ShoppingListScreen(database: db),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => SettingsScreen(database: db),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/recipe/new',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => RecipeEditorScreen(database: db),
      ),
      GoRoute(
        path: '/recipe/:id',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '');
          if (id == null) {
            return const Scaffold(
              body: Center(child: Text('Invalid recipe')),
            );
          }
          return RecipeEditorScreen(database: db, recipeId: id);
        },
      ),
    ],
  );
}
