import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_box/core/app_router.dart';
import 'package:recipe_box/core/theme.dart';
import 'package:recipe_box/data/app_database.dart';

class RecipeBoxApp extends StatefulWidget {
  const RecipeBoxApp({super.key, required this.database});

  final AppDatabase database;

  @override
  State<RecipeBoxApp> createState() => _RecipeBoxAppState();
}

class _RecipeBoxAppState extends State<RecipeBoxApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createAppRouter(widget.database);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe Box',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
