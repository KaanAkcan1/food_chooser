import 'package:json_annotation/json_annotation.dart';
import '../ingredient/ingredient_model.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final String id;
  final String name;
  final List<Ingredient> ingredients;
  final String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  // JSON -> Recipe
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  // Recipe -> JSON
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
