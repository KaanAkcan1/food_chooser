import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/ingredient/ingredient_model.dart';
import '../../domain/repositories/repository.dart';

class IngredientProvider with ChangeNotifier {
  final BaseRepository<Ingredient> _ingredientRepository;

  // Constructor
  IngredientProvider(SharedPreferences sharedPreferences)
      : _ingredientRepository =
            BaseRepository<Ingredient>(sharedPreferences, 'ingredient_key');

  // Add new ingredient
  Future<void> addIngredient(Ingredient ingredient) async {
    await _ingredientRepository.add(ingredient);
    notifyListeners(); // Update listeners after change
  }

  // Update an existing ingredient
  Future<void> updateIngredient(Ingredient ingredient) async {
    await _ingredientRepository.update(ingredient);
    notifyListeners(); // Update listeners after change
  }

  // Delete an ingredient by id
  Future<void> deleteIngredient(String id) async {
    await _ingredientRepository.delete(id);
    notifyListeners(); // Update listeners after change
  }

  // Get all ingredients
  Future<List<Ingredient>> getAllIngredients() async {
    return await _ingredientRepository.getAll();
  }

  // Get a specific ingredient by id
  Future<Ingredient?> getIngredientById(String id) async {
    return await _ingredientRepository.getById(id);
  }
}
