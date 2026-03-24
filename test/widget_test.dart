import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_box/app.dart';
import 'package:recipe_box/data/app_database.dart';

void main() {
  testWidgets('Recipe Box shell loads', (WidgetTester tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    await tester.pumpWidget(RecipeBoxApp(database: database));
    await tester.pumpAndSettle();
    expect(find.text('Recipes'), findsWidgets);
    await database.close();
  });
}
