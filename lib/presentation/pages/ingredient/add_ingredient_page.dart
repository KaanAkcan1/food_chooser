import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:go_router/go_router.dart';
import 'application/providers/ingredient_provider.dart';
import 'data/models/ingredient_model.dart';

class AddIngredientPage extends ConsumerStatefulWidget {
  const AddIngredientPage({Key? key}) : super(key: key);

  @override
  _AddIngredientPageState createState() => _AddIngredientPageState();
}

class _AddIngredientPageState extends ConsumerState<AddIngredientPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  void _addIngredient() {
    if (_formKey.currentState!.validate()) {
      final newIngredient = Ingredient(
        id: const Uuid().v4(), 
        name: _nameController.text.trim(),
        quantity: _quantityController.text.trim(),
      );

      ref.read(ingredientProvider.notifier).addIngredient(newIngredient);
      context.pop(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Malzeme Ekle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Malzeme Adı"),
                validator: (value) => value!.isEmpty ? "Bu alan boş bırakılamaz" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: "Miktar"),
                validator: (value) => value!.isEmpty ? "Bu alan boş bırakılamaz" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _addIngredient,
                child: const Text("Ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
