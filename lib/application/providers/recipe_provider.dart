import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/recipe/recipe_model.dart';
import '../../domain/repositories/repository.dart';

class RecipeProvider with ChangeNotifier {
  final BaseRepository<Recipe> _recipeRepository;

  // Constructor
  RecipeProvider(SharedPreferences sharedPreferences)
      : _recipeRepository =
            BaseRepository<Recipe>(sharedPreferences, 'recipe_key');

  // Add new recipe
  Future<void> addRecipe(Recipe recipe) async {
    await _recipeRepository.add(recipe);
    notifyListeners(); // Update listeners after change
  }

  // Update an existing recipe
  Future<void> updateRecipe(Recipe recipe) async {
    await _recipeRepository.update(recipe);
    notifyListeners(); // Update listeners after change
  }

  // Delete a recipe by id
  Future<void> deleteRecipe(String id) async {
    await _recipeRepository.delete(id);
    notifyListeners(); // Update listeners after change
  }

  // Get all recipes
  Future<List<Recipe>> getAllRecipes() async {
    return await _recipeRepository.getAll();
  }

  // Get a specific recipe by id
  Future<Recipe?> getRecipeById(String id) async {
    return await _recipeRepository.getById(id);
  }
}
