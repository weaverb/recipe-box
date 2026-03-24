import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_box/data/app_database.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: StreamBuilder<List<Recipe>>(
        stream: database.watchRecipesOrdered(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final list = snapshot.data ?? [];
          if (list.isEmpty) {
            return Center(
              child: Text(
                'No recipes yet.\nTap + to add one.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: list.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final r = list[i];
              return ListTile(
                title: Text(r.title),
                subtitle: r.description != null && r.description!.isNotEmpty
                    ? Text(
                        r.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    : null,
                onTap: () => context.push('/recipe/${r.id}'),
                trailing: IconButton(
                  tooltip: r.isFavorite ? 'Unfavorite' : 'Favorite',
                  icon: Icon(
                    r.isFavorite ? Icons.star : Icons.star_outline,
                  ),
                  onPressed: () async {
                    await (database.update(database.recipes)
                          ..where((t) => t.id.equals(r.id)))
                        .write(
                      RecipesCompanion(isFavorite: Value(!r.isFavorite)),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/recipe/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
