import 'package:flutter/material.dart';
import 'package:recipe_box/app.dart';
import 'package:recipe_box/data/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  runApp(RecipeBoxApp(database: database));
}
