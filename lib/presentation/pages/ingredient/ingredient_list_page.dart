import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek_tarifi/application/providers/ingredient_provider.dart';
import 'ingredient_widgets.dart';

class IngredientListPage extends ConsumerWidget {
  const IngredientListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientList = ref.watch(ingredientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Malzeme Listesi"),
      ),
      body: ingredientList.isEmpty
          ? const Center(child: Text("Henüz malzeme eklenmedi"))
          : ListView.builder(
              itemCount: ingredientList.length,
              itemBuilder: (context, index) {
                final ingredient = ingredientList[index];
                return IngredientListTile(ingredient: ingredient);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/ingredient/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
