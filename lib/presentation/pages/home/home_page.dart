import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/models/recipe/recipe_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  List<String> _selectedIngredients = [];

  @override
  Widget build(BuildContext context) {
    final recipeProvider = context.watch<RecipeProvider>();
    List<Recipe> filteredRecipes = recipeProvider.recipes;

    // Arama ve Filtreleme Uygula
    if (_searchQuery.isNotEmpty) {
      filteredRecipes = filteredRecipes.where((recipe) {
        return recipe.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    if (_selectedIngredients.isNotEmpty) {
      filteredRecipes = filteredRecipes.where((recipe) {
        return _selectedIngredients
            .every((ingredient) => recipe.ingredients.contains(ingredient));
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Yemek Tarifleri")),
      body: Column(
        children: [
          // 🔍 Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Tarif Ara...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // 🥦 Malzemeler İçin Filtreleme Seçimi
          Wrap(
            spacing: 8,
            children: [
              "Domates",
              "Soğan",
              "Tavuk",
              "Pirinç",
              "Patates",
              "Tereyağ"
            ].map((ingredient) {
              final isSelected = _selectedIngredients.contains(ingredient);
              return FilterChip(
                label: Text(ingredient),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedIngredients.add(ingredient);
                    } else {
                      _selectedIngredients.remove(ingredient);
                    }
                  });
                },
              );
            }).toList(),
          ),

          // 📄 Tarif Listesi
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  subtitle: Text(recipe.ingredients.join(", ")),
                  onTap: () => context.push('/recipe/detail', extra: recipe),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
