import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class Ingredient {
  final String id;
  final String name;
  final double quantity;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
  });

  // JSON -> Ingredient
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  // Ingredient -> JSON
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
