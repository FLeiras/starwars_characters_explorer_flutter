import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../controllers/character_controller.dart';
import '../../../controllers/favorites_controllers.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/global_widgets/custom_navbar.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/favorites/widgets/favorites_section.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController characterController = Get.find();
    final favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: const CustomNavbar(),
          ),
          SearchBar(
            hintText: 'Buscar en favoritos...',
            controller: favoritesController.searchController,
            onChanged: (_) {},
            onSubmitted: (_) {
              favoritesController.searchController.clear();
            },
          ),
          FavoritesSection(
            favoritesController: favoritesController,
            characterController: characterController,
          ),
        ],
      ),
    );
  }
}
