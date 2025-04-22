import 'package:get/get.dart';

import '../controllers/character_controller.dart';
import 'package:starwars_characters_explorer_flutter/app/data/character_service.dart';
import 'package:starwars_characters_explorer_flutter/app/controllers/favorites_controllers.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(
      () => CharacterController(),
    );
    Get.lazyPut<CharacterService>(
      () => CharacterService(),
    );
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(),
    );
  }
}
