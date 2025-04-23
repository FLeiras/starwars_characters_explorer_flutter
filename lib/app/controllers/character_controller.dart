import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../data/character_service.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/utils/log_message.dart';
import 'package:starwars_characters_explorer_flutter/app/data/model/character_model.dart';

class CharacterController extends GetxController {
  final CharacterService _characterService = Get.find();
  final searchTextController = TextEditingController();

  final isLoading = false.obs;
  final hasError = false.obs;
  final characters = <Character>[].obs;
  final filteredCharacters = <Character>[].obs;
  final currentPage = 1.obs;
  final hasNextPage = true.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters({bool loadMore = false}) async {
    if (!loadMore) {
      isLoading.value = true;
      hasError.value = false;
      currentPage.value = 1;
      characters.clear();
    }

    try {
      final response = await _characterService.fetchCharacters();
      characters.addAll(response.results);
      filteredCharacters.assignAll(characters);
      hasNextPage.value = response.next != null;
      currentPage.value += 1;
    } catch (e) {
      hasError.value = true;
      logMessage('Error fetching characters: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchCharacters(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (query.isEmpty) {
        filteredCharacters.assignAll(characters);
      } else {
        final lowerQuery = query.toLowerCase();
        filteredCharacters.assignAll(
          characters.where((c) => c.name.toLowerCase().contains(lowerQuery)),
        );
      }
    });
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  void loadMoreCharacters() {
    if (hasNextPage.value && !isLoading.value) {
      fetchCharacters(loadMore: true);
    }
  }

  void retry() {
    fetchCharacters();
  }
}
