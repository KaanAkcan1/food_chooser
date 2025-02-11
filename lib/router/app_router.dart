import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/recipe/recipe_model.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/ingredient/add_ingredient_page.dart';
import '../presentation/pages/ingredient/ingredient_list_page.dart';
import '../presentation/pages/recipe/add_recipe_page.dart';
import '../presentation/pages/recipe/recipe_detail_page.dart';
import '../presentation/pages/recipe/recipe_list_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Home Page
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // Recipe Pages
    GoRoute(
      path: '/recipe/list',
      builder: (context, state) => const RecipeListPage(),
    ),

    GoRoute(
      path: '/recipe/detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeDetailPage(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/recipe/add',
      builder: (context, state) => const AddRecipePage(),
    ),
// Ingredient Pages
    GoRoute(
      path: '/ingredient/list',
      builder: (context, state) => const IngredientListPage(),
    ),
    GoRoute(
      path: '/ingredient/add',
      builder: (context, state) => const AddIngredientPage(),
    ),
  ],
);
