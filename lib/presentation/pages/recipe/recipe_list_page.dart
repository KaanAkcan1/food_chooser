import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek_tarifi/application/providers/recipe_provider.dart';
import 'package:yemek_tarifi/presentation/pages/recipe/recipe_widgets.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeProvider = context.watch<RecipeProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Yemek Tarifleri")),
      body: ListView.builder(
        itemCount: recipeProvider.recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipeProvider.recipes[index];

          return RecipeCard(
            recipe: recipe,
            onTap: () => context.push('/recipe/detail', extra: recipe),
            onDelete: () => recipeProvider.deleteRecipe(recipe.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/recipe/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
