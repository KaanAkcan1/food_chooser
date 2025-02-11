import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek_tarifi/data/models/recipe_model.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Malzemeler:",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            ...recipe.ingredients.map(
              (ingredient) => Text("• $ingredient"),
            ),
            const SizedBox(height: 16),
            Text(
              "Hazırlık Aşamaları:",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(recipe.instructions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Geri gitme veya silme işlemi eklenebilir
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
