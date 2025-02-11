import 'dart:convert';
import 'package:food_chooser/data/models/ingredient/ingredient_model.dart';
import 'package:http/http.dart' as http;

import '../models/recipe/recipe_model.dart';

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource(this.client);

  // Tarifleri almak için API çağrısı
  Future<List<Recipe>> fetchRecipes() async {
    final response =
        await client.get(Uri.parse('https://your-api-endpoint.com/recipes'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Recipe.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // Yeni tarif eklemek için API çağrısı
  Future<void> saveRecipe(Recipe recipe) async {
    final response = await client.post(
      Uri.parse('https://your-api-endpoint.com/recipes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(recipe.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add recipe');
    }
  }

  // Tarifleri almak için API çağrısı
  Future<List<Ingredient>> fetchIngredients() async {
    final response =
        await client.get(Uri.parse('https://your-api-endpoint.com/recipes'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Ingredient.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // Yeni tarif eklemek için API çağrısı
  Future<void> saveIngredient(Ingredient ingredient) async {
    final response = await client.post(
      Uri.parse('https://your-api-endpoint.com/recipes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(ingredient.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add recipe');
    }
  }
}
