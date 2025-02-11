import 'package:flutter/material.dart';
import 'data/models/ingredient_model.dart';

class IngredientListTile extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientListTile({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(ingredient.name),
        subtitle: Text("Miktar: ${ingredient.quantity}"),
        trailing: const Icon(Icons.kitchen),
      ),
    );
  }
}
