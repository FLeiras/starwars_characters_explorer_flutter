import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/character_image.dart';
import '../../home/widgets/character_card.dart';
import '../../../../controllers/character_controller.dart';
import '../../../../controllers/favorites_controllers.dart';

class FavoritesSection extends StatelessWidget {
  final FavoritesController favoritesController;
  final CharacterController characterController;

  const FavoritesSection({
    super.key,
    required this.favoritesController,
    required this.characterController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final favorites = favoritesController.filteredFavorites.toList();

        if (favorites.isEmpty) {
          final hasFavorites = favoritesController.favorites.isNotEmpty;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hasFavorites
                      ? 'No hay coincidencias con tu búsqueda.'
                      : 'No tenes favoritos.',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/not_found.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    characterController.searchCharacters('');
                    favoritesController.searchController.clear();
                  },
                  child: const Text(
                    'Mis Favoritos',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            int crossAxisCount;

            if (screenWidth >= 1200) {
              crossAxisCount = 4;
            } else if (screenWidth >= 800) {
              crossAxisCount = 3;
            } else if (screenWidth >= 500) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final name = favorites[index];
                final imagePath = getCharacterImage(name);
                return CharacterCard(name: name, imagePath: imagePath);
              },
            );
          },
        );
      }),
    );
  }
}
