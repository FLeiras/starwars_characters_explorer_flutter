import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  final _favorites = <String>{}.obs;
  final _storage = GetStorage();
  final _storageKey = 'favorites';

  List<String> get favorites => _favorites.toList();

  @override
  void onInit() {
    super.onInit();
    final storedFavorites = _storage.read<List<dynamic>>(_storageKey);
    if (storedFavorites != null) {
      _favorites.addAll(storedFavorites.cast<String>());
    }
  }

  void toggleFavorite(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
    } else {
      _favorites.add(name);
    }
    _storage.write(_storageKey, _favorites.toList());
  }

  bool isFavorite(String name) => _favorites.contains(name);
}
