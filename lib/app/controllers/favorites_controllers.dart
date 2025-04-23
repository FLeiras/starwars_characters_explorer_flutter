import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  final _favorites = <String>{}.obs;
  final _storage = GetStorage();
  final _storageKey = 'favorites';

  final searchController = TextEditingController();
  final filteredFavorites = <String>[].obs;

  List<String> get favorites => _favorites.toList();

  @override
  void onInit() {
    super.onInit();

    final storedFavorites = _storage.read<List<dynamic>>(_storageKey);
    if (storedFavorites != null) {
      _favorites.addAll(storedFavorites.cast<String>());
    }

    //! Filtro con todos los favoritos
    filteredFavorites.assignAll(_favorites.toList());

    //! Escucho cambios en el campo de búsqueda
    searchController.addListener(_filterFavorites);
  }

  void _filterFavorites() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredFavorites.assignAll(_favorites.toList());
    } else {
      filteredFavorites.assignAll(
        _favorites.where((name) => name.toLowerCase().contains(query)).toList(),
      );
    }
  }

  void toggleFavorite(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
    } else {
      _favorites.add(name);
    }

    _storage.write(_storageKey, _favorites.toList());

    //! Refiltro por si cambia el listado
    _filterFavorites();
  }

  bool isFavorite(String name) => _favorites.contains(name);

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
