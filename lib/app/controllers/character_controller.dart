import 'package:get/get.dart';

import 'package:starwars_characters_explorer_flutter/app/data/model/character_model.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/utils/log_message.dart';

import '../data/character_service.dart';

class CharacterController extends GetxController {
  final CharacterService _characterService = Get.find();

  var isLoading = false.obs;
  var hasError = false.obs;
  var characters = <Character>[].obs;
  var currentPage = 1.obs;
  var hasNextPage = true.obs;

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
      hasNextPage.value = response.next != null;
      currentPage.value += 1;
    } catch (e) {
      hasError.value = true;
      logMessage('Error fetching characters: $e');
    } finally {
      isLoading.value = false;
    }
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
