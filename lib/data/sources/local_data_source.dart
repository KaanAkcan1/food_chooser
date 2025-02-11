import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ingredient/ingredient_model.dart';
import '../models/recipe/recipe_model.dart';

class LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSource(this.sharedPreferences);

  // Yerel depolamadan tarifleri almak
  Future<List<Recipe>> fetchRecipesFromLocal() async {
    final String? recipesJson = sharedPreferences.getString('recipes');
    if (recipesJson != null) {
      List<dynamic> data = json.decode(recipesJson);
      return data.map((item) => Recipe.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  // Yeni tarifleri yerel depolamaya kaydetmek
  Future<void> saveRecipesToLocal(List<Recipe> recipes) async {
    List<Map<String, dynamic>> recipesJson =
        recipes.map((recipe) => recipe.toJson()).toList();
    await sharedPreferences.setString('recipes', json.encode(recipesJson));
  }

  Future<void> deleteRecipe(String id) async {
    final recipes = await fetchRecipesFromLocal();
    recipes.removeWhere((i) => i.id == id);
    await sharedPreferences.setString('recipes', jsonEncode(recipes));
  }

  // Yerel depolamadan tarifleri almak
  Future<List<Ingredient>> fetchIngredientsFromLocal() async {
    final String? ingredientsJson = sharedPreferences.getString('ingredients');
    if (ingredientsJson != null) {
      List<dynamic> data = json.decode(ingredientsJson);
      return data.map((item) => Ingredient.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  // Yeni tarifleri yerel depolamaya kaydetmek
  Future<void> saveIngredientsToLocal(List<Ingredient> ingredients) async {
    List<Map<String, dynamic>> ingredientsJson =
        ingredients.map((ingredient) => ingredient.toJson()).toList();
    await sharedPreferences.setString(
        'ingredients', json.encode(ingredientsJson));
  }

  Future<void> deleteIngredient(String id) async {
    final ingredients = await fetchIngredientsFromLocal();
    ingredients.removeWhere((i) => i.id == id);
    await sharedPreferences.setString('ingredients', jsonEncode(ingredients));
  }
}
