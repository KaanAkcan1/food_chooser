import 'package:flutter/material.dart';
import 'package:yemek_tarifi/data/models/recipe_model.dart';
import 'package:yemek_tarifi/application/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeProvider _recipeProvider;

  RecipeViewModel(this._recipeProvider);

  List<RecipeModel> get recipes => _recipeProvider.recipes;

  void addRecipe(RecipeModel recipe) {
    _recipeProvider.addRecipe(recipe);
    notifyListeners();
  }

  void deleteRecipe(String id) {
    _recipeProvider.deleteRecipe(id);
    notifyListeners();
  }
}
