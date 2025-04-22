import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home/widgets/character_card.dart';
import '../../../controllers/favorites_controllers.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/utils/character_image.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/custom_navbar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      body: Column(
        children: [
          const CustomNavbar(),
          Expanded(
            child: Obx(() {
              final favorites = favoritesController.favorites.toList();

              if (favorites.isEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        'No hay favoritos todavía',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/not_found.png',
                      width: 800,
                      height: 1000,
                    ),
                  ],
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.06,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final name = favorites[index];
                  final imagePath = getCharacterImage(name);
                  return CharacterCard(name: name, imagePath: imagePath);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
