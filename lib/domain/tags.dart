import 'dart:convert';

import 'package:recipe_box/data/app_database.dart';

List<String> parseTagsJson(String json) {
  try {
    final decoded = jsonDecode(json);
    if (decoded is List) {
      return decoded
          .map((e) => e.toString().toLowerCase().trim())
          .where((s) => s.isNotEmpty)
          .toList();
    }
  } catch (_) {}
  return <String>[];
}

String encodeTagsJson(List<String> tags) {
  final normalized = tags
      .map((t) => t.toLowerCase().trim())
      .where((t) => t.isNotEmpty)
      .toSet()
      .toList()
    ..sort();
  return jsonEncode(normalized);
}

bool ingredientHasAnyIgnoredTag(Ingredient ing, Set<String> ignoredLower) {
  if (ignoredLower.isEmpty) return false;
  for (final t in parseTagsJson(ing.tagsJson)) {
    if (ignoredLower.contains(t)) return true;
  }
  return false;
}
