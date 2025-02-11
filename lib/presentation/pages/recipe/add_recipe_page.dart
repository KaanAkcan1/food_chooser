import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek_tarifi/data/models/recipe_model.dart';
import 'package:yemek_tarifi/application/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({Key? key}) : super(key: key);

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = RecipeModel(
        id: DateTime.now().toString(),
        name: _nameController.text,
        ingredients: _ingredientsController.text.split(',').map((e) => e.trim()).toList(),
        instructions: _instructionsController.text,
      );

      context.read<RecipeProvider>().addRecipe(newRecipe);
      context.pop(); // Sayfadan çık
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Tarif Ekle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Tarif Adı"),
                validator: (value) => value!.isEmpty ? "Bu alan boş bırakılamaz" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: "Malzemeler (virgülle ayırın)"),
                validator: (value) => value!.isEmpty ? "Malzemeleri girin" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _instructionsController,
                decoration: const InputDecoration(labelText: "Hazırlık Aşamaları"),
                maxLines: 4,
                validator: (value) => value!.isEmpty ? "Talimatları girin" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: const Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
