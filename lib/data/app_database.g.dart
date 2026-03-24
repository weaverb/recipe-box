// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IngredientsTable extends Ingredients
    with TableInfo<$IngredientsTable, Ingredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultUnitMeta = const VerificationMeta(
    'defaultUnit',
  );
  @override
  late final GeneratedColumn<String> defaultUnit = GeneratedColumn<String>(
    'default_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, defaultUnit, tagsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ingredient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('default_unit')) {
      context.handle(
        _defaultUnitMeta,
        defaultUnit.isAcceptableOrUnknown(
          data['default_unit']!,
          _defaultUnitMeta,
        ),
      );
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ingredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ingredient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      defaultUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_unit'],
      )!,
      tagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags_json'],
      )!,
    );
  }

  @override
  $IngredientsTable createAlias(String alias) {
    return $IngredientsTable(attachedDatabase, alias);
  }
}

class Ingredient extends DataClass implements Insertable<Ingredient> {
  final int id;
  final String name;
  final String defaultUnit;
  final String tagsJson;
  const Ingredient({
    required this.id,
    required this.name,
    required this.defaultUnit,
    required this.tagsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['default_unit'] = Variable<String>(defaultUnit);
    map['tags_json'] = Variable<String>(tagsJson);
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      id: Value(id),
      name: Value(name),
      defaultUnit: Value(defaultUnit),
      tagsJson: Value(tagsJson),
    );
  }

  factory Ingredient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ingredient(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      defaultUnit: serializer.fromJson<String>(json['defaultUnit']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'defaultUnit': serializer.toJson<String>(defaultUnit),
      'tagsJson': serializer.toJson<String>(tagsJson),
    };
  }

  Ingredient copyWith({
    int? id,
    String? name,
    String? defaultUnit,
    String? tagsJson,
  }) => Ingredient(
    id: id ?? this.id,
    name: name ?? this.name,
    defaultUnit: defaultUnit ?? this.defaultUnit,
    tagsJson: tagsJson ?? this.tagsJson,
  );
  Ingredient copyWithCompanion(IngredientsCompanion data) {
    return Ingredient(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      defaultUnit: data.defaultUnit.present
          ? data.defaultUnit.value
          : this.defaultUnit,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ingredient(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('tagsJson: $tagsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, defaultUnit, tagsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ingredient &&
          other.id == this.id &&
          other.name == this.name &&
          other.defaultUnit == this.defaultUnit &&
          other.tagsJson == this.tagsJson);
}

class IngredientsCompanion extends UpdateCompanion<Ingredient> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> defaultUnit;
  final Value<String> tagsJson;
  const IngredientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.tagsJson = const Value.absent(),
  });
  IngredientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.defaultUnit = const Value.absent(),
    this.tagsJson = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Ingredient> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? defaultUnit,
    Expression<String>? tagsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (defaultUnit != null) 'default_unit': defaultUnit,
      if (tagsJson != null) 'tags_json': tagsJson,
    });
  }

  IngredientsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? defaultUnit,
    Value<String>? tagsJson,
  }) {
    return IngredientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      tagsJson: tagsJson ?? this.tagsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (defaultUnit.present) {
      map['default_unit'] = Variable<String>(defaultUnit.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('tagsJson: $tagsJson')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    instructions,
    isFavorite,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final int id;
  final String title;
  final String? description;
  final String instructions;
  final bool isFavorite;
  final DateTime createdAt;
  const Recipe({
    required this.id,
    required this.title,
    this.description,
    required this.instructions,
    required this.isFavorite,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['instructions'] = Variable<String>(instructions);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      instructions: Value(instructions),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
    );
  }

  factory Recipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      instructions: serializer.fromJson<String>(json['instructions']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'instructions': serializer.toJson<String>(instructions),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Recipe copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    String? instructions,
    bool? isFavorite,
    DateTime? createdAt,
  }) => Recipe(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    instructions: instructions ?? this.instructions,
    isFavorite: isFavorite ?? this.isFavorite,
    createdAt: createdAt ?? this.createdAt,
  );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, instructions, isFavorite, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.instructions == this.instructions &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> instructions;
  final Value<bool> isFavorite;
  final Value<DateTime> createdAt;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.instructions = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.instructions = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Recipe> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? instructions,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (instructions != null) 'instructions': instructions,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecipesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? instructions,
    Value<bool>? isFavorite,
    Value<DateTime>? createdAt,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTable extends RecipeIngredients
    with TableInfo<$RecipeIngredientsTable, RecipeIngredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredients (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    ingredientId,
    amount,
    unit,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeIngredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $RecipeIngredientsTable createAlias(String alias) {
    return $RecipeIngredientsTable(attachedDatabase, alias);
  }
}

class RecipeIngredient extends DataClass
    implements Insertable<RecipeIngredient> {
  final int id;
  final int recipeId;
  final int ingredientId;
  final double? amount;
  final String unit;
  final String? note;
  const RecipeIngredient({
    required this.id,
    required this.recipeId,
    required this.ingredientId,
    this.amount,
    required this.unit,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['ingredient_id'] = Variable<int>(ingredientId);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  RecipeIngredientsCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      ingredientId: Value(ingredientId),
      amount: amount == null && nullToAbsent
          ? const Value.absent()
          : Value(amount),
      unit: Value(unit),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory RecipeIngredient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredient(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      amount: serializer.fromJson<double?>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'ingredientId': serializer.toJson<int>(ingredientId),
      'amount': serializer.toJson<double?>(amount),
      'unit': serializer.toJson<String>(unit),
      'note': serializer.toJson<String?>(note),
    };
  }

  RecipeIngredient copyWith({
    int? id,
    int? recipeId,
    int? ingredientId,
    Value<double?> amount = const Value.absent(),
    String? unit,
    Value<String?> note = const Value.absent(),
  }) => RecipeIngredient(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    ingredientId: ingredientId ?? this.ingredientId,
    amount: amount.present ? amount.value : this.amount,
    unit: unit ?? this.unit,
    note: note.present ? note.value : this.note,
  );
  RecipeIngredient copyWithCompanion(RecipeIngredientsCompanion data) {
    return RecipeIngredient(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredient(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recipeId, ingredientId, amount, unit, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredient &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.ingredientId == this.ingredientId &&
          other.amount == this.amount &&
          other.unit == this.unit &&
          other.note == this.note);
}

class RecipeIngredientsCompanion extends UpdateCompanion<RecipeIngredient> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> ingredientId;
  final Value<double?> amount;
  final Value<String> unit;
  final Value<String?> note;
  const RecipeIngredientsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
  });
  RecipeIngredientsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int ingredientId,
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.note = const Value.absent(),
  }) : recipeId = Value(recipeId),
       ingredientId = Value(ingredientId);
  static Insertable<RecipeIngredient> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? ingredientId,
    Expression<double>? amount,
    Expression<String>? unit,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (note != null) 'note': note,
    });
  }

  RecipeIngredientsCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? ingredientId,
    Value<double?>? amount,
    Value<String>? unit,
    Value<String?>? note,
  }) {
    return RecipeIngredientsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      ingredientId: ingredientId ?? this.ingredientId,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $PantryItemsTable extends PantryItems
    with TableInfo<$PantryItemsTable, PantryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PantryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredients (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, ingredientId, quantity, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pantry_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PantryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PantryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PantryItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $PantryItemsTable createAlias(String alias) {
    return $PantryItemsTable(attachedDatabase, alias);
  }
}

class PantryItem extends DataClass implements Insertable<PantryItem> {
  final int id;
  final int ingredientId;
  final double quantity;
  final String unit;
  const PantryItem({
    required this.id,
    required this.ingredientId,
    required this.quantity,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ingredient_id'] = Variable<int>(ingredientId);
    map['quantity'] = Variable<double>(quantity);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  PantryItemsCompanion toCompanion(bool nullToAbsent) {
    return PantryItemsCompanion(
      id: Value(id),
      ingredientId: Value(ingredientId),
      quantity: Value(quantity),
      unit: Value(unit),
    );
  }

  factory PantryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PantryItem(
      id: serializer.fromJson<int>(json['id']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ingredientId': serializer.toJson<int>(ingredientId),
      'quantity': serializer.toJson<double>(quantity),
      'unit': serializer.toJson<String>(unit),
    };
  }

  PantryItem copyWith({
    int? id,
    int? ingredientId,
    double? quantity,
    String? unit,
  }) => PantryItem(
    id: id ?? this.id,
    ingredientId: ingredientId ?? this.ingredientId,
    quantity: quantity ?? this.quantity,
    unit: unit ?? this.unit,
  );
  PantryItem copyWithCompanion(PantryItemsCompanion data) {
    return PantryItem(
      id: data.id.present ? data.id.value : this.id,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PantryItem(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ingredientId, quantity, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PantryItem &&
          other.id == this.id &&
          other.ingredientId == this.ingredientId &&
          other.quantity == this.quantity &&
          other.unit == this.unit);
}

class PantryItemsCompanion extends UpdateCompanion<PantryItem> {
  final Value<int> id;
  final Value<int> ingredientId;
  final Value<double> quantity;
  final Value<String> unit;
  const PantryItemsCompanion({
    this.id = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
  });
  PantryItemsCompanion.insert({
    this.id = const Value.absent(),
    required int ingredientId,
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
  }) : ingredientId = Value(ingredientId);
  static Insertable<PantryItem> custom({
    Expression<int>? id,
    Expression<int>? ingredientId,
    Expression<double>? quantity,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (quantity != null) 'quantity': quantity,
      if (unit != null) 'unit': unit,
    });
  }

  PantryItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? ingredientId,
    Value<double>? quantity,
    Value<String>? unit,
  }) {
    return PantryItemsCompanion(
      id: id ?? this.id,
      ingredientId: ingredientId ?? this.ingredientId,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PantryItemsCompanion(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $MealPlanDaysTable extends MealPlanDays
    with TableInfo<$MealPlanDaysTable, MealPlanDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlanDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _epochDayMeta = const VerificationMeta(
    'epochDay',
  );
  @override
  late final GeneratedColumn<int> epochDay = GeneratedColumn<int>(
    'epoch_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, epochDay];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plan_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealPlanDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('epoch_day')) {
      context.handle(
        _epochDayMeta,
        epochDay.isAcceptableOrUnknown(data['epoch_day']!, _epochDayMeta),
      );
    } else if (isInserting) {
      context.missing(_epochDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPlanDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlanDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      epochDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}epoch_day'],
      )!,
    );
  }

  @override
  $MealPlanDaysTable createAlias(String alias) {
    return $MealPlanDaysTable(attachedDatabase, alias);
  }
}

class MealPlanDay extends DataClass implements Insertable<MealPlanDay> {
  final int id;
  final int epochDay;
  const MealPlanDay({required this.id, required this.epochDay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['epoch_day'] = Variable<int>(epochDay);
    return map;
  }

  MealPlanDaysCompanion toCompanion(bool nullToAbsent) {
    return MealPlanDaysCompanion(id: Value(id), epochDay: Value(epochDay));
  }

  factory MealPlanDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPlanDay(
      id: serializer.fromJson<int>(json['id']),
      epochDay: serializer.fromJson<int>(json['epochDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'epochDay': serializer.toJson<int>(epochDay),
    };
  }

  MealPlanDay copyWith({int? id, int? epochDay}) =>
      MealPlanDay(id: id ?? this.id, epochDay: epochDay ?? this.epochDay);
  MealPlanDay copyWithCompanion(MealPlanDaysCompanion data) {
    return MealPlanDay(
      id: data.id.present ? data.id.value : this.id,
      epochDay: data.epochDay.present ? data.epochDay.value : this.epochDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanDay(')
          ..write('id: $id, ')
          ..write('epochDay: $epochDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, epochDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPlanDay &&
          other.id == this.id &&
          other.epochDay == this.epochDay);
}

class MealPlanDaysCompanion extends UpdateCompanion<MealPlanDay> {
  final Value<int> id;
  final Value<int> epochDay;
  const MealPlanDaysCompanion({
    this.id = const Value.absent(),
    this.epochDay = const Value.absent(),
  });
  MealPlanDaysCompanion.insert({
    this.id = const Value.absent(),
    required int epochDay,
  }) : epochDay = Value(epochDay);
  static Insertable<MealPlanDay> custom({
    Expression<int>? id,
    Expression<int>? epochDay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (epochDay != null) 'epoch_day': epochDay,
    });
  }

  MealPlanDaysCompanion copyWith({Value<int>? id, Value<int>? epochDay}) {
    return MealPlanDaysCompanion(
      id: id ?? this.id,
      epochDay: epochDay ?? this.epochDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (epochDay.present) {
      map['epoch_day'] = Variable<int>(epochDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanDaysCompanion(')
          ..write('id: $id, ')
          ..write('epochDay: $epochDay')
          ..write(')'))
        .toString();
  }
}

class $MealPlanSlotsTable extends MealPlanSlots
    with TableInfo<$MealPlanSlotsTable, MealPlanSlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlanSlotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
    'day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_plan_days (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dayId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plan_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealPlanSlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day_id')) {
      context.handle(
        _dayIdMeta,
        dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPlanSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlanSlot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $MealPlanSlotsTable createAlias(String alias) {
    return $MealPlanSlotsTable(attachedDatabase, alias);
  }
}

class MealPlanSlot extends DataClass implements Insertable<MealPlanSlot> {
  final int id;
  final int dayId;
  final String name;
  const MealPlanSlot({
    required this.id,
    required this.dayId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day_id'] = Variable<int>(dayId);
    map['name'] = Variable<String>(name);
    return map;
  }

  MealPlanSlotsCompanion toCompanion(bool nullToAbsent) {
    return MealPlanSlotsCompanion(
      id: Value(id),
      dayId: Value(dayId),
      name: Value(name),
    );
  }

  factory MealPlanSlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPlanSlot(
      id: serializer.fromJson<int>(json['id']),
      dayId: serializer.fromJson<int>(json['dayId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dayId': serializer.toJson<int>(dayId),
      'name': serializer.toJson<String>(name),
    };
  }

  MealPlanSlot copyWith({int? id, int? dayId, String? name}) => MealPlanSlot(
    id: id ?? this.id,
    dayId: dayId ?? this.dayId,
    name: name ?? this.name,
  );
  MealPlanSlot copyWithCompanion(MealPlanSlotsCompanion data) {
    return MealPlanSlot(
      id: data.id.present ? data.id.value : this.id,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanSlot(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dayId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPlanSlot &&
          other.id == this.id &&
          other.dayId == this.dayId &&
          other.name == this.name);
}

class MealPlanSlotsCompanion extends UpdateCompanion<MealPlanSlot> {
  final Value<int> id;
  final Value<int> dayId;
  final Value<String> name;
  const MealPlanSlotsCompanion({
    this.id = const Value.absent(),
    this.dayId = const Value.absent(),
    this.name = const Value.absent(),
  });
  MealPlanSlotsCompanion.insert({
    this.id = const Value.absent(),
    required int dayId,
    required String name,
  }) : dayId = Value(dayId),
       name = Value(name);
  static Insertable<MealPlanSlot> custom({
    Expression<int>? id,
    Expression<int>? dayId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayId != null) 'day_id': dayId,
      if (name != null) 'name': name,
    });
  }

  MealPlanSlotsCompanion copyWith({
    Value<int>? id,
    Value<int>? dayId,
    Value<String>? name,
  }) {
    return MealPlanSlotsCompanion(
      id: id ?? this.id,
      dayId: dayId ?? this.dayId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanSlotsCompanion(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MealPlanSlotRecipesTable extends MealPlanSlotRecipes
    with TableInfo<$MealPlanSlotRecipesTable, MealPlanSlotRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlanSlotRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
    'slot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_plan_slots (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, slotId, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plan_slot_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealPlanSlotRecipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('slot_id')) {
      context.handle(
        _slotIdMeta,
        slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta),
      );
    } else if (isInserting) {
      context.missing(_slotIdMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealPlanSlotRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlanSlotRecipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      slotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}slot_id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
    );
  }

  @override
  $MealPlanSlotRecipesTable createAlias(String alias) {
    return $MealPlanSlotRecipesTable(attachedDatabase, alias);
  }
}

class MealPlanSlotRecipe extends DataClass
    implements Insertable<MealPlanSlotRecipe> {
  final int id;
  final int slotId;
  final int recipeId;
  const MealPlanSlotRecipe({
    required this.id,
    required this.slotId,
    required this.recipeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['slot_id'] = Variable<int>(slotId);
    map['recipe_id'] = Variable<int>(recipeId);
    return map;
  }

  MealPlanSlotRecipesCompanion toCompanion(bool nullToAbsent) {
    return MealPlanSlotRecipesCompanion(
      id: Value(id),
      slotId: Value(slotId),
      recipeId: Value(recipeId),
    );
  }

  factory MealPlanSlotRecipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealPlanSlotRecipe(
      id: serializer.fromJson<int>(json['id']),
      slotId: serializer.fromJson<int>(json['slotId']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'slotId': serializer.toJson<int>(slotId),
      'recipeId': serializer.toJson<int>(recipeId),
    };
  }

  MealPlanSlotRecipe copyWith({int? id, int? slotId, int? recipeId}) =>
      MealPlanSlotRecipe(
        id: id ?? this.id,
        slotId: slotId ?? this.slotId,
        recipeId: recipeId ?? this.recipeId,
      );
  MealPlanSlotRecipe copyWithCompanion(MealPlanSlotRecipesCompanion data) {
    return MealPlanSlotRecipe(
      id: data.id.present ? data.id.value : this.id,
      slotId: data.slotId.present ? data.slotId.value : this.slotId,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanSlotRecipe(')
          ..write('id: $id, ')
          ..write('slotId: $slotId, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, slotId, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealPlanSlotRecipe &&
          other.id == this.id &&
          other.slotId == this.slotId &&
          other.recipeId == this.recipeId);
}

class MealPlanSlotRecipesCompanion extends UpdateCompanion<MealPlanSlotRecipe> {
  final Value<int> id;
  final Value<int> slotId;
  final Value<int> recipeId;
  const MealPlanSlotRecipesCompanion({
    this.id = const Value.absent(),
    this.slotId = const Value.absent(),
    this.recipeId = const Value.absent(),
  });
  MealPlanSlotRecipesCompanion.insert({
    this.id = const Value.absent(),
    required int slotId,
    required int recipeId,
  }) : slotId = Value(slotId),
       recipeId = Value(recipeId);
  static Insertable<MealPlanSlotRecipe> custom({
    Expression<int>? id,
    Expression<int>? slotId,
    Expression<int>? recipeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slotId != null) 'slot_id': slotId,
      if (recipeId != null) 'recipe_id': recipeId,
    });
  }

  MealPlanSlotRecipesCompanion copyWith({
    Value<int>? id,
    Value<int>? slotId,
    Value<int>? recipeId,
  }) {
    return MealPlanSlotRecipesCompanion(
      id: id ?? this.id,
      slotId: slotId ?? this.slotId,
      recipeId: recipeId ?? this.recipeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanSlotRecipesCompanion(')
          ..write('id: $id, ')
          ..write('slotId: $slotId, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }
}

class $UserPrefsTable extends UserPrefs
    with TableInfo<$UserPrefsTable, UserPref> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPrefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _shoppingIgnoredTagsJsonMeta =
      const VerificationMeta('shoppingIgnoredTagsJson');
  @override
  late final GeneratedColumn<String> shoppingIgnoredTagsJson =
      GeneratedColumn<String>(
        'shopping_ignored_tags_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      );
  @override
  List<GeneratedColumn> get $columns => [id, shoppingIgnoredTagsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_prefs';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserPref> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shopping_ignored_tags_json')) {
      context.handle(
        _shoppingIgnoredTagsJsonMeta,
        shoppingIgnoredTagsJson.isAcceptableOrUnknown(
          data['shopping_ignored_tags_json']!,
          _shoppingIgnoredTagsJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPref map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPref(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shoppingIgnoredTagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shopping_ignored_tags_json'],
      )!,
    );
  }

  @override
  $UserPrefsTable createAlias(String alias) {
    return $UserPrefsTable(attachedDatabase, alias);
  }
}

class UserPref extends DataClass implements Insertable<UserPref> {
  final int id;
  final String shoppingIgnoredTagsJson;
  const UserPref({required this.id, required this.shoppingIgnoredTagsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shopping_ignored_tags_json'] = Variable<String>(
      shoppingIgnoredTagsJson,
    );
    return map;
  }

  UserPrefsCompanion toCompanion(bool nullToAbsent) {
    return UserPrefsCompanion(
      id: Value(id),
      shoppingIgnoredTagsJson: Value(shoppingIgnoredTagsJson),
    );
  }

  factory UserPref.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPref(
      id: serializer.fromJson<int>(json['id']),
      shoppingIgnoredTagsJson: serializer.fromJson<String>(
        json['shoppingIgnoredTagsJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shoppingIgnoredTagsJson': serializer.toJson<String>(
        shoppingIgnoredTagsJson,
      ),
    };
  }

  UserPref copyWith({int? id, String? shoppingIgnoredTagsJson}) => UserPref(
    id: id ?? this.id,
    shoppingIgnoredTagsJson:
        shoppingIgnoredTagsJson ?? this.shoppingIgnoredTagsJson,
  );
  UserPref copyWithCompanion(UserPrefsCompanion data) {
    return UserPref(
      id: data.id.present ? data.id.value : this.id,
      shoppingIgnoredTagsJson: data.shoppingIgnoredTagsJson.present
          ? data.shoppingIgnoredTagsJson.value
          : this.shoppingIgnoredTagsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserPref(')
          ..write('id: $id, ')
          ..write('shoppingIgnoredTagsJson: $shoppingIgnoredTagsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, shoppingIgnoredTagsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPref &&
          other.id == this.id &&
          other.shoppingIgnoredTagsJson == this.shoppingIgnoredTagsJson);
}

class UserPrefsCompanion extends UpdateCompanion<UserPref> {
  final Value<int> id;
  final Value<String> shoppingIgnoredTagsJson;
  const UserPrefsCompanion({
    this.id = const Value.absent(),
    this.shoppingIgnoredTagsJson = const Value.absent(),
  });
  UserPrefsCompanion.insert({
    this.id = const Value.absent(),
    this.shoppingIgnoredTagsJson = const Value.absent(),
  });
  static Insertable<UserPref> custom({
    Expression<int>? id,
    Expression<String>? shoppingIgnoredTagsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shoppingIgnoredTagsJson != null)
        'shopping_ignored_tags_json': shoppingIgnoredTagsJson,
    });
  }

  UserPrefsCompanion copyWith({
    Value<int>? id,
    Value<String>? shoppingIgnoredTagsJson,
  }) {
    return UserPrefsCompanion(
      id: id ?? this.id,
      shoppingIgnoredTagsJson:
          shoppingIgnoredTagsJson ?? this.shoppingIgnoredTagsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shoppingIgnoredTagsJson.present) {
      map['shopping_ignored_tags_json'] = Variable<String>(
        shoppingIgnoredTagsJson.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPrefsCompanion(')
          ..write('id: $id, ')
          ..write('shoppingIgnoredTagsJson: $shoppingIgnoredTagsJson')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IngredientsTable ingredients = $IngredientsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeIngredientsTable recipeIngredients =
      $RecipeIngredientsTable(this);
  late final $PantryItemsTable pantryItems = $PantryItemsTable(this);
  late final $MealPlanDaysTable mealPlanDays = $MealPlanDaysTable(this);
  late final $MealPlanSlotsTable mealPlanSlots = $MealPlanSlotsTable(this);
  late final $MealPlanSlotRecipesTable mealPlanSlotRecipes =
      $MealPlanSlotRecipesTable(this);
  late final $UserPrefsTable userPrefs = $UserPrefsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ingredients,
    recipes,
    recipeIngredients,
    pantryItems,
    mealPlanDays,
    mealPlanSlots,
    mealPlanSlotRecipes,
    userPrefs,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_ingredients', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredients',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('pantry_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'meal_plan_days',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meal_plan_slots', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'meal_plan_slots',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meal_plan_slot_recipes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meal_plan_slot_recipes', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$IngredientsTableCreateCompanionBuilder =
    IngredientsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> defaultUnit,
      Value<String> tagsJson,
    });
typedef $$IngredientsTableUpdateCompanionBuilder =
    IngredientsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> defaultUnit,
      Value<String> tagsJson,
    });

final class $$IngredientsTableReferences
    extends BaseReferences<_$AppDatabase, $IngredientsTable, Ingredient> {
  $$IngredientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeIngredientsTable, List<RecipeIngredient>>
  _recipeIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredients,
        aliasName: $_aliasNameGenerator(
          db.ingredients.id,
          db.recipeIngredients.ingredientId,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientsRefs {
    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PantryItemsTable, List<PantryItem>>
  _pantryItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pantryItems,
    aliasName: $_aliasNameGenerator(
      db.ingredients.id,
      db.pantryItems.ingredientId,
    ),
  );

  $$PantryItemsTableProcessedTableManager get pantryItemsRefs {
    final manager = $$PantryItemsTableTableManager(
      $_db,
      $_db.pantryItems,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pantryItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsRefs(
    Expression<bool> Function($$RecipeIngredientsTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pantryItemsRefs(
    Expression<bool> Function($$PantryItemsTableFilterComposer f) f,
  ) {
    final $$PantryItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pantryItems,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PantryItemsTableFilterComposer(
            $db: $db,
            $table: $db.pantryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  Expression<T> recipeIngredientsRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> pantryItemsRefs<T extends Object>(
    Expression<T> Function($$PantryItemsTableAnnotationComposer a) f,
  ) {
    final $$PantryItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pantryItems,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PantryItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.pantryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientsTable,
          Ingredient,
          $$IngredientsTableFilterComposer,
          $$IngredientsTableOrderingComposer,
          $$IngredientsTableAnnotationComposer,
          $$IngredientsTableCreateCompanionBuilder,
          $$IngredientsTableUpdateCompanionBuilder,
          (Ingredient, $$IngredientsTableReferences),
          Ingredient,
          PrefetchHooks Function({
            bool recipeIngredientsRefs,
            bool pantryItemsRefs,
          })
        > {
  $$IngredientsTableTableManager(_$AppDatabase db, $IngredientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> defaultUnit = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
              }) => IngredientsCompanion(
                id: id,
                name: name,
                defaultUnit: defaultUnit,
                tagsJson: tagsJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> defaultUnit = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
              }) => IngredientsCompanion.insert(
                id: id,
                name: name,
                defaultUnit: defaultUnit,
                tagsJson: tagsJson,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeIngredientsRefs = false, pantryItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeIngredientsRefs) db.recipeIngredients,
                    if (pantryItemsRefs) db.pantryItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeIngredientsRefs)
                        await $_getPrefetchedData<
                          Ingredient,
                          $IngredientsTable,
                          RecipeIngredient
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientsTableReferences
                              ._recipeIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientsTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ingredientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (pantryItemsRefs)
                        await $_getPrefetchedData<
                          Ingredient,
                          $IngredientsTable,
                          PantryItem
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientsTableReferences
                              ._pantryItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientsTableReferences(
                                db,
                                table,
                                p0,
                              ).pantryItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ingredientId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientsTable,
      Ingredient,
      $$IngredientsTableFilterComposer,
      $$IngredientsTableOrderingComposer,
      $$IngredientsTableAnnotationComposer,
      $$IngredientsTableCreateCompanionBuilder,
      $$IngredientsTableUpdateCompanionBuilder,
      (Ingredient, $$IngredientsTableReferences),
      Ingredient,
      PrefetchHooks Function({bool recipeIngredientsRefs, bool pantryItemsRefs})
    >;
typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      Value<String> instructions,
      Value<bool> isFavorite,
      Value<DateTime> createdAt,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<String> instructions,
      Value<bool> isFavorite,
      Value<DateTime> createdAt,
    });

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, Recipe> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeIngredientsTable, List<RecipeIngredient>>
  _recipeIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredients,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.recipeIngredients.recipeId,
        ),
      );

  $$RecipeIngredientsTableProcessedTableManager get recipeIngredientsRefs {
    final manager = $$RecipeIngredientsTableTableManager(
      $_db,
      $_db.recipeIngredients,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MealPlanSlotRecipesTable,
    List<MealPlanSlotRecipe>
  >
  _mealPlanSlotRecipesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.mealPlanSlotRecipes,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.mealPlanSlotRecipes.recipeId,
        ),
      );

  $$MealPlanSlotRecipesTableProcessedTableManager get mealPlanSlotRecipesRefs {
    final manager = $$MealPlanSlotRecipesTableTableManager(
      $_db,
      $_db.mealPlanSlotRecipes,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _mealPlanSlotRecipesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsRefs(
    Expression<bool> Function($$RecipeIngredientsTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredients,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealPlanSlotRecipesRefs(
    Expression<bool> Function($$MealPlanSlotRecipesTableFilterComposer f) f,
  ) {
    final $$MealPlanSlotRecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealPlanSlotRecipes,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotRecipesTableFilterComposer(
            $db: $db,
            $table: $db.mealPlanSlotRecipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> recipeIngredientsRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredients,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> mealPlanSlotRecipesRefs<T extends Object>(
    Expression<T> Function($$MealPlanSlotRecipesTableAnnotationComposer a) f,
  ) {
    final $$MealPlanSlotRecipesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.mealPlanSlotRecipes,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MealPlanSlotRecipesTableAnnotationComposer(
                $db: $db,
                $table: $db.mealPlanSlotRecipes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          Recipe,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (Recipe, $$RecipesTableReferences),
          Recipe,
          PrefetchHooks Function({
            bool recipeIngredientsRefs,
            bool mealPlanSlotRecipesRefs,
          })
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                title: title,
                description: description,
                instructions: instructions,
                isFavorite: isFavorite,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                title: title,
                description: description,
                instructions: instructions,
                isFavorite: isFavorite,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeIngredientsRefs = false,
                mealPlanSlotRecipesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeIngredientsRefs) db.recipeIngredients,
                    if (mealPlanSlotRecipesRefs) db.mealPlanSlotRecipes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeIngredientsRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          RecipeIngredient
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealPlanSlotRecipesRefs)
                        await $_getPrefetchedData<
                          Recipe,
                          $RecipesTable,
                          MealPlanSlotRecipe
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._mealPlanSlotRecipesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).mealPlanSlotRecipesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      Recipe,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (Recipe, $$RecipesTableReferences),
      Recipe,
      PrefetchHooks Function({
        bool recipeIngredientsRefs,
        bool mealPlanSlotRecipesRefs,
      })
    >;
typedef $$RecipeIngredientsTableCreateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      Value<int> id,
      required int recipeId,
      required int ingredientId,
      Value<double?> amount,
      Value<String> unit,
      Value<String?> note,
    });
typedef $$RecipeIngredientsTableUpdateCompanionBuilder =
    RecipeIngredientsCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<int> ingredientId,
      Value<double?> amount,
      Value<String> unit,
      Value<String?> note,
    });

final class $$RecipeIngredientsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredient
        > {
  $$RecipeIngredientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeIngredients.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IngredientsTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredients.createAlias(
        $_aliasNameGenerator(
          db.recipeIngredients.ingredientId,
          db.ingredients.id,
        ),
      );

  $$IngredientsTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientsTableTableManager(
      $_db,
      $_db.ingredients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableFilterComposer get ingredientId {
    final $$IngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableFilterComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableOrderingComposer get ingredientId {
    final $$IngredientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableOrderingComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTable> {
  $$RecipeIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientsTableAnnotationComposer get ingredientId {
    final $$IngredientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientsTable,
          RecipeIngredient,
          $$RecipeIngredientsTableFilterComposer,
          $$RecipeIngredientsTableOrderingComposer,
          $$RecipeIngredientsTableAnnotationComposer,
          $$RecipeIngredientsTableCreateCompanionBuilder,
          $$RecipeIngredientsTableUpdateCompanionBuilder,
          (RecipeIngredient, $$RecipeIngredientsTableReferences),
          RecipeIngredient,
          PrefetchHooks Function({bool recipeId, bool ingredientId})
        > {
  $$RecipeIngredientsTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> ingredientId = const Value.absent(),
                Value<double?> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => RecipeIngredientsCompanion(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                amount: amount,
                unit: unit,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int ingredientId,
                Value<double?> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => RecipeIngredientsCompanion.insert(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                amount: amount,
                unit: unit,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeIngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false, ingredientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$RecipeIngredientsTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$RecipeIngredientsTableReferences
                                        ._recipeIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (ingredientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ingredientId,
                                referencedTable:
                                    $$RecipeIngredientsTableReferences
                                        ._ingredientIdTable(db),
                                referencedColumn:
                                    $$RecipeIngredientsTableReferences
                                        ._ingredientIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecipeIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientsTable,
      RecipeIngredient,
      $$RecipeIngredientsTableFilterComposer,
      $$RecipeIngredientsTableOrderingComposer,
      $$RecipeIngredientsTableAnnotationComposer,
      $$RecipeIngredientsTableCreateCompanionBuilder,
      $$RecipeIngredientsTableUpdateCompanionBuilder,
      (RecipeIngredient, $$RecipeIngredientsTableReferences),
      RecipeIngredient,
      PrefetchHooks Function({bool recipeId, bool ingredientId})
    >;
typedef $$PantryItemsTableCreateCompanionBuilder =
    PantryItemsCompanion Function({
      Value<int> id,
      required int ingredientId,
      Value<double> quantity,
      Value<String> unit,
    });
typedef $$PantryItemsTableUpdateCompanionBuilder =
    PantryItemsCompanion Function({
      Value<int> id,
      Value<int> ingredientId,
      Value<double> quantity,
      Value<String> unit,
    });

final class $$PantryItemsTableReferences
    extends BaseReferences<_$AppDatabase, $PantryItemsTable, PantryItem> {
  $$PantryItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IngredientsTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredients.createAlias(
        $_aliasNameGenerator(db.pantryItems.ingredientId, db.ingredients.id),
      );

  $$IngredientsTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientsTableTableManager(
      $_db,
      $_db.ingredients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PantryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  $$IngredientsTableFilterComposer get ingredientId {
    final $$IngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableFilterComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PantryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  $$IngredientsTableOrderingComposer get ingredientId {
    final $$IngredientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableOrderingComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PantryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PantryItemsTable> {
  $$PantryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  $$IngredientsTableAnnotationComposer get ingredientId {
    final $$IngredientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PantryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PantryItemsTable,
          PantryItem,
          $$PantryItemsTableFilterComposer,
          $$PantryItemsTableOrderingComposer,
          $$PantryItemsTableAnnotationComposer,
          $$PantryItemsTableCreateCompanionBuilder,
          $$PantryItemsTableUpdateCompanionBuilder,
          (PantryItem, $$PantryItemsTableReferences),
          PantryItem,
          PrefetchHooks Function({bool ingredientId})
        > {
  $$PantryItemsTableTableManager(_$AppDatabase db, $PantryItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PantryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PantryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PantryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ingredientId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String> unit = const Value.absent(),
              }) => PantryItemsCompanion(
                id: id,
                ingredientId: ingredientId,
                quantity: quantity,
                unit: unit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ingredientId,
                Value<double> quantity = const Value.absent(),
                Value<String> unit = const Value.absent(),
              }) => PantryItemsCompanion.insert(
                id: id,
                ingredientId: ingredientId,
                quantity: quantity,
                unit: unit,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PantryItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ingredientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ingredientId,
                                referencedTable: $$PantryItemsTableReferences
                                    ._ingredientIdTable(db),
                                referencedColumn: $$PantryItemsTableReferences
                                    ._ingredientIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PantryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PantryItemsTable,
      PantryItem,
      $$PantryItemsTableFilterComposer,
      $$PantryItemsTableOrderingComposer,
      $$PantryItemsTableAnnotationComposer,
      $$PantryItemsTableCreateCompanionBuilder,
      $$PantryItemsTableUpdateCompanionBuilder,
      (PantryItem, $$PantryItemsTableReferences),
      PantryItem,
      PrefetchHooks Function({bool ingredientId})
    >;
typedef $$MealPlanDaysTableCreateCompanionBuilder =
    MealPlanDaysCompanion Function({Value<int> id, required int epochDay});
typedef $$MealPlanDaysTableUpdateCompanionBuilder =
    MealPlanDaysCompanion Function({Value<int> id, Value<int> epochDay});

final class $$MealPlanDaysTableReferences
    extends BaseReferences<_$AppDatabase, $MealPlanDaysTable, MealPlanDay> {
  $$MealPlanDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MealPlanSlotsTable, List<MealPlanSlot>>
  _mealPlanSlotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealPlanSlots,
    aliasName: $_aliasNameGenerator(db.mealPlanDays.id, db.mealPlanSlots.dayId),
  );

  $$MealPlanSlotsTableProcessedTableManager get mealPlanSlotsRefs {
    final manager = $$MealPlanSlotsTableTableManager(
      $_db,
      $_db.mealPlanSlots,
    ).filter((f) => f.dayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealPlanSlotsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealPlanDaysTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlanDaysTable> {
  $$MealPlanDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get epochDay => $composableBuilder(
    column: $table.epochDay,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mealPlanSlotsRefs(
    Expression<bool> Function($$MealPlanSlotsTableFilterComposer f) f,
  ) {
    final $$MealPlanSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealPlanSlots,
      getReferencedColumn: (t) => t.dayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotsTableFilterComposer(
            $db: $db,
            $table: $db.mealPlanSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealPlanDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlanDaysTable> {
  $$MealPlanDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get epochDay => $composableBuilder(
    column: $table.epochDay,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MealPlanDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlanDaysTable> {
  $$MealPlanDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get epochDay =>
      $composableBuilder(column: $table.epochDay, builder: (column) => column);

  Expression<T> mealPlanSlotsRefs<T extends Object>(
    Expression<T> Function($$MealPlanSlotsTableAnnotationComposer a) f,
  ) {
    final $$MealPlanSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealPlanSlots,
      getReferencedColumn: (t) => t.dayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealPlanSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealPlanDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealPlanDaysTable,
          MealPlanDay,
          $$MealPlanDaysTableFilterComposer,
          $$MealPlanDaysTableOrderingComposer,
          $$MealPlanDaysTableAnnotationComposer,
          $$MealPlanDaysTableCreateCompanionBuilder,
          $$MealPlanDaysTableUpdateCompanionBuilder,
          (MealPlanDay, $$MealPlanDaysTableReferences),
          MealPlanDay,
          PrefetchHooks Function({bool mealPlanSlotsRefs})
        > {
  $$MealPlanDaysTableTableManager(_$AppDatabase db, $MealPlanDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlanDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlanDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPlanDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> epochDay = const Value.absent(),
              }) => MealPlanDaysCompanion(id: id, epochDay: epochDay),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required int epochDay}) =>
                  MealPlanDaysCompanion.insert(id: id, epochDay: epochDay),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealPlanDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealPlanSlotsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (mealPlanSlotsRefs) db.mealPlanSlots,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mealPlanSlotsRefs)
                    await $_getPrefetchedData<
                      MealPlanDay,
                      $MealPlanDaysTable,
                      MealPlanSlot
                    >(
                      currentTable: table,
                      referencedTable: $$MealPlanDaysTableReferences
                          ._mealPlanSlotsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MealPlanDaysTableReferences(
                            db,
                            table,
                            p0,
                          ).mealPlanSlotsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.dayId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MealPlanDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealPlanDaysTable,
      MealPlanDay,
      $$MealPlanDaysTableFilterComposer,
      $$MealPlanDaysTableOrderingComposer,
      $$MealPlanDaysTableAnnotationComposer,
      $$MealPlanDaysTableCreateCompanionBuilder,
      $$MealPlanDaysTableUpdateCompanionBuilder,
      (MealPlanDay, $$MealPlanDaysTableReferences),
      MealPlanDay,
      PrefetchHooks Function({bool mealPlanSlotsRefs})
    >;
typedef $$MealPlanSlotsTableCreateCompanionBuilder =
    MealPlanSlotsCompanion Function({
      Value<int> id,
      required int dayId,
      required String name,
    });
typedef $$MealPlanSlotsTableUpdateCompanionBuilder =
    MealPlanSlotsCompanion Function({
      Value<int> id,
      Value<int> dayId,
      Value<String> name,
    });

final class $$MealPlanSlotsTableReferences
    extends BaseReferences<_$AppDatabase, $MealPlanSlotsTable, MealPlanSlot> {
  $$MealPlanSlotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MealPlanDaysTable _dayIdTable(_$AppDatabase db) =>
      db.mealPlanDays.createAlias(
        $_aliasNameGenerator(db.mealPlanSlots.dayId, db.mealPlanDays.id),
      );

  $$MealPlanDaysTableProcessedTableManager get dayId {
    final $_column = $_itemColumn<int>('day_id')!;

    final manager = $$MealPlanDaysTableTableManager(
      $_db,
      $_db.mealPlanDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $MealPlanSlotRecipesTable,
    List<MealPlanSlotRecipe>
  >
  _mealPlanSlotRecipesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.mealPlanSlotRecipes,
        aliasName: $_aliasNameGenerator(
          db.mealPlanSlots.id,
          db.mealPlanSlotRecipes.slotId,
        ),
      );

  $$MealPlanSlotRecipesTableProcessedTableManager get mealPlanSlotRecipesRefs {
    final manager = $$MealPlanSlotRecipesTableTableManager(
      $_db,
      $_db.mealPlanSlotRecipes,
    ).filter((f) => f.slotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _mealPlanSlotRecipesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealPlanSlotsTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlanSlotsTable> {
  $$MealPlanSlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$MealPlanDaysTableFilterComposer get dayId {
    final $$MealPlanDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.mealPlanDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanDaysTableFilterComposer(
            $db: $db,
            $table: $db.mealPlanDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mealPlanSlotRecipesRefs(
    Expression<bool> Function($$MealPlanSlotRecipesTableFilterComposer f) f,
  ) {
    final $$MealPlanSlotRecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealPlanSlotRecipes,
      getReferencedColumn: (t) => t.slotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotRecipesTableFilterComposer(
            $db: $db,
            $table: $db.mealPlanSlotRecipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealPlanSlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlanSlotsTable> {
  $$MealPlanSlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealPlanDaysTableOrderingComposer get dayId {
    final $$MealPlanDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.mealPlanDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanDaysTableOrderingComposer(
            $db: $db,
            $table: $db.mealPlanDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealPlanSlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlanSlotsTable> {
  $$MealPlanSlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$MealPlanDaysTableAnnotationComposer get dayId {
    final $$MealPlanDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.mealPlanDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.mealPlanDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mealPlanSlotRecipesRefs<T extends Object>(
    Expression<T> Function($$MealPlanSlotRecipesTableAnnotationComposer a) f,
  ) {
    final $$MealPlanSlotRecipesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.mealPlanSlotRecipes,
          getReferencedColumn: (t) => t.slotId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MealPlanSlotRecipesTableAnnotationComposer(
                $db: $db,
                $table: $db.mealPlanSlotRecipes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MealPlanSlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealPlanSlotsTable,
          MealPlanSlot,
          $$MealPlanSlotsTableFilterComposer,
          $$MealPlanSlotsTableOrderingComposer,
          $$MealPlanSlotsTableAnnotationComposer,
          $$MealPlanSlotsTableCreateCompanionBuilder,
          $$MealPlanSlotsTableUpdateCompanionBuilder,
          (MealPlanSlot, $$MealPlanSlotsTableReferences),
          MealPlanSlot,
          PrefetchHooks Function({bool dayId, bool mealPlanSlotRecipesRefs})
        > {
  $$MealPlanSlotsTableTableManager(_$AppDatabase db, $MealPlanSlotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlanSlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlanSlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPlanSlotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dayId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => MealPlanSlotsCompanion(id: id, dayId: dayId, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dayId,
                required String name,
              }) => MealPlanSlotsCompanion.insert(
                id: id,
                dayId: dayId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealPlanSlotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dayId = false, mealPlanSlotRecipesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealPlanSlotRecipesRefs) db.mealPlanSlotRecipes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (dayId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dayId,
                                    referencedTable:
                                        $$MealPlanSlotsTableReferences
                                            ._dayIdTable(db),
                                    referencedColumn:
                                        $$MealPlanSlotsTableReferences
                                            ._dayIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mealPlanSlotRecipesRefs)
                        await $_getPrefetchedData<
                          MealPlanSlot,
                          $MealPlanSlotsTable,
                          MealPlanSlotRecipe
                        >(
                          currentTable: table,
                          referencedTable: $$MealPlanSlotsTableReferences
                              ._mealPlanSlotRecipesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealPlanSlotsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealPlanSlotRecipesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.slotId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MealPlanSlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealPlanSlotsTable,
      MealPlanSlot,
      $$MealPlanSlotsTableFilterComposer,
      $$MealPlanSlotsTableOrderingComposer,
      $$MealPlanSlotsTableAnnotationComposer,
      $$MealPlanSlotsTableCreateCompanionBuilder,
      $$MealPlanSlotsTableUpdateCompanionBuilder,
      (MealPlanSlot, $$MealPlanSlotsTableReferences),
      MealPlanSlot,
      PrefetchHooks Function({bool dayId, bool mealPlanSlotRecipesRefs})
    >;
typedef $$MealPlanSlotRecipesTableCreateCompanionBuilder =
    MealPlanSlotRecipesCompanion Function({
      Value<int> id,
      required int slotId,
      required int recipeId,
    });
typedef $$MealPlanSlotRecipesTableUpdateCompanionBuilder =
    MealPlanSlotRecipesCompanion Function({
      Value<int> id,
      Value<int> slotId,
      Value<int> recipeId,
    });

final class $$MealPlanSlotRecipesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MealPlanSlotRecipesTable,
          MealPlanSlotRecipe
        > {
  $$MealPlanSlotRecipesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MealPlanSlotsTable _slotIdTable(_$AppDatabase db) =>
      db.mealPlanSlots.createAlias(
        $_aliasNameGenerator(
          db.mealPlanSlotRecipes.slotId,
          db.mealPlanSlots.id,
        ),
      );

  $$MealPlanSlotsTableProcessedTableManager get slotId {
    final $_column = $_itemColumn<int>('slot_id')!;

    final manager = $$MealPlanSlotsTableTableManager(
      $_db,
      $_db.mealPlanSlots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_slotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.mealPlanSlotRecipes.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealPlanSlotRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlanSlotRecipesTable> {
  $$MealPlanSlotRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$MealPlanSlotsTableFilterComposer get slotId {
    final $$MealPlanSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.mealPlanSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotsTableFilterComposer(
            $db: $db,
            $table: $db.mealPlanSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealPlanSlotRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlanSlotRecipesTable> {
  $$MealPlanSlotRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealPlanSlotsTableOrderingComposer get slotId {
    final $$MealPlanSlotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.mealPlanSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotsTableOrderingComposer(
            $db: $db,
            $table: $db.mealPlanSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealPlanSlotRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlanSlotRecipesTable> {
  $$MealPlanSlotRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$MealPlanSlotsTableAnnotationComposer get slotId {
    final $$MealPlanSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.mealPlanSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealPlanSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealPlanSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealPlanSlotRecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealPlanSlotRecipesTable,
          MealPlanSlotRecipe,
          $$MealPlanSlotRecipesTableFilterComposer,
          $$MealPlanSlotRecipesTableOrderingComposer,
          $$MealPlanSlotRecipesTableAnnotationComposer,
          $$MealPlanSlotRecipesTableCreateCompanionBuilder,
          $$MealPlanSlotRecipesTableUpdateCompanionBuilder,
          (MealPlanSlotRecipe, $$MealPlanSlotRecipesTableReferences),
          MealPlanSlotRecipe,
          PrefetchHooks Function({bool slotId, bool recipeId})
        > {
  $$MealPlanSlotRecipesTableTableManager(
    _$AppDatabase db,
    $MealPlanSlotRecipesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlanSlotRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlanSlotRecipesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MealPlanSlotRecipesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> slotId = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
              }) => MealPlanSlotRecipesCompanion(
                id: id,
                slotId: slotId,
                recipeId: recipeId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int slotId,
                required int recipeId,
              }) => MealPlanSlotRecipesCompanion.insert(
                id: id,
                slotId: slotId,
                recipeId: recipeId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MealPlanSlotRecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({slotId = false, recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (slotId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.slotId,
                                referencedTable:
                                    $$MealPlanSlotRecipesTableReferences
                                        ._slotIdTable(db),
                                referencedColumn:
                                    $$MealPlanSlotRecipesTableReferences
                                        ._slotIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$MealPlanSlotRecipesTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$MealPlanSlotRecipesTableReferences
                                        ._recipeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MealPlanSlotRecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealPlanSlotRecipesTable,
      MealPlanSlotRecipe,
      $$MealPlanSlotRecipesTableFilterComposer,
      $$MealPlanSlotRecipesTableOrderingComposer,
      $$MealPlanSlotRecipesTableAnnotationComposer,
      $$MealPlanSlotRecipesTableCreateCompanionBuilder,
      $$MealPlanSlotRecipesTableUpdateCompanionBuilder,
      (MealPlanSlotRecipe, $$MealPlanSlotRecipesTableReferences),
      MealPlanSlotRecipe,
      PrefetchHooks Function({bool slotId, bool recipeId})
    >;
typedef $$UserPrefsTableCreateCompanionBuilder =
    UserPrefsCompanion Function({
      Value<int> id,
      Value<String> shoppingIgnoredTagsJson,
    });
typedef $$UserPrefsTableUpdateCompanionBuilder =
    UserPrefsCompanion Function({
      Value<int> id,
      Value<String> shoppingIgnoredTagsJson,
    });

class $$UserPrefsTableFilterComposer
    extends Composer<_$AppDatabase, $UserPrefsTable> {
  $$UserPrefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shoppingIgnoredTagsJson => $composableBuilder(
    column: $table.shoppingIgnoredTagsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserPrefsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserPrefsTable> {
  $$UserPrefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shoppingIgnoredTagsJson => $composableBuilder(
    column: $table.shoppingIgnoredTagsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserPrefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserPrefsTable> {
  $$UserPrefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shoppingIgnoredTagsJson => $composableBuilder(
    column: $table.shoppingIgnoredTagsJson,
    builder: (column) => column,
  );
}

class $$UserPrefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserPrefsTable,
          UserPref,
          $$UserPrefsTableFilterComposer,
          $$UserPrefsTableOrderingComposer,
          $$UserPrefsTableAnnotationComposer,
          $$UserPrefsTableCreateCompanionBuilder,
          $$UserPrefsTableUpdateCompanionBuilder,
          (UserPref, BaseReferences<_$AppDatabase, $UserPrefsTable, UserPref>),
          UserPref,
          PrefetchHooks Function()
        > {
  $$UserPrefsTableTableManager(_$AppDatabase db, $UserPrefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPrefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPrefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPrefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shoppingIgnoredTagsJson = const Value.absent(),
              }) => UserPrefsCompanion(
                id: id,
                shoppingIgnoredTagsJson: shoppingIgnoredTagsJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shoppingIgnoredTagsJson = const Value.absent(),
              }) => UserPrefsCompanion.insert(
                id: id,
                shoppingIgnoredTagsJson: shoppingIgnoredTagsJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserPrefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserPrefsTable,
      UserPref,
      $$UserPrefsTableFilterComposer,
      $$UserPrefsTableOrderingComposer,
      $$UserPrefsTableAnnotationComposer,
      $$UserPrefsTableCreateCompanionBuilder,
      $$UserPrefsTableUpdateCompanionBuilder,
      (UserPref, BaseReferences<_$AppDatabase, $UserPrefsTable, UserPref>),
      UserPref,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IngredientsTableTableManager get ingredients =>
      $$IngredientsTableTableManager(_db, _db.ingredients);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$RecipeIngredientsTableTableManager get recipeIngredients =>
      $$RecipeIngredientsTableTableManager(_db, _db.recipeIngredients);
  $$PantryItemsTableTableManager get pantryItems =>
      $$PantryItemsTableTableManager(_db, _db.pantryItems);
  $$MealPlanDaysTableTableManager get mealPlanDays =>
      $$MealPlanDaysTableTableManager(_db, _db.mealPlanDays);
  $$MealPlanSlotsTableTableManager get mealPlanSlots =>
      $$MealPlanSlotsTableTableManager(_db, _db.mealPlanSlots);
  $$MealPlanSlotRecipesTableTableManager get mealPlanSlotRecipes =>
      $$MealPlanSlotRecipesTableTableManager(_db, _db.mealPlanSlotRecipes);
  $$UserPrefsTableTableManager get userPrefs =>
      $$UserPrefsTableTableManager(_db, _db.userPrefs);
}
