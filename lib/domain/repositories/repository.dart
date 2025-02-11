import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/recipe/recipe_model.dart';
import 'i_repository.dart';

class BaseRepository<T> implements IRepository<T> {
  final SharedPreferences _sharedPreferences;
  final String _key;

  BaseRepository(this._sharedPreferences, this._key);

  @override
  Future<void> add(T item) async {
    final list = _sharedPreferences.getStringList(_key) ?? [];
    list.add(jsonEncode(item)); // Öğeyi JSON formatında saklıyoruz
    await _sharedPreferences.setStringList(_key, list);
  }

  @override
  Future<void> update(T item) async {
    final list = _sharedPreferences.getStringList(_key) ?? [];
    final index = list.indexWhere(
        (e) => jsonDecode(e)['id'] == jsonDecode(jsonEncode(item))['id']);
    if (index != -1) {
      list[index] = jsonEncode(item);
      await _sharedPreferences.setStringList(_key, list);
    }
  }

  @override
  Future<void> delete(String id) async {
    final list = _sharedPreferences.getStringList(_key) ?? [];
    list.removeWhere((e) => jsonDecode(e)['id'] == id);
    await _sharedPreferences.setStringList(_key, list);
  }

  @override
  Future<List<T>> getAll() async {
    final list = _sharedPreferences.getStringList(_key) ?? [];
    return list.map((e) => _fromJson(e)).toList();
  }

  @override
  Future<T?> getById(String id) async {
    final list = _sharedPreferences.getStringList(_key) ?? [];
    final item =
        list.firstWhere((e) => jsonDecode(e)['id'] == id, orElse: () => '');
    return item.isEmpty ? null : _fromJson(item);
  }

  // JSON verisini Dart nesnesine çeviriyoruz
  T _fromJson(String jsonString) {
    // Burada 'T' tipi için JSON'u nesneye dönüştürmelisiniz
    if (T == Recipe) {
      return Recipe.fromJson(jsonDecode(jsonString)) as T;
    }
    throw UnimplementedError('fromJson methodu implement edilmelidir');
  }
}
