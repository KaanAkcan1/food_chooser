import 'package:flutter/material.dart';
import 'package:yemek_tarifi/data/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(recipe.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("Malzemeler: ${recipe.ingredients.join(', ')}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: onTap,
      ),
    );
  }
}
