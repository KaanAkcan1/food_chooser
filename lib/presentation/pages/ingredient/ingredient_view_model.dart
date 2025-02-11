import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/models/ingredient_model.dart';

// Malzemeleri yöneten provider
final ingredientProvider = StateNotifierProvider<IngredientViewModel, List<Ingredient>>((ref) {
  return IngredientViewModel();
});

class IngredientViewModel extends StateNotifier<List<Ingredient>> {
  IngredientViewModel() : super([]);

  void addIngredient(Ingredient ingredient) {
    state = [...state, ingredient];
  }

  void removeIngredient(String id) {
    state = state.where((ingredient) => ingredient.id != id).toList();
  }
}
