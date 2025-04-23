import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starwars_characters_explorer_flutter/app/controllers/home_controller.dart';
import 'package:starwars_characters_explorer_flutter/app/controllers/character_controller.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/global_widgets/custom_navbar.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/horizontal_character_list.dart';

import 'widgets/grid_characters_list.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController characterController = Get.find();
    final HomeController homeController = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: const CustomNavbar(),
          ),
          SearchBar(
            hintText: 'Buscar personaje...',
            controller: homeController.searchController,
            onChanged: (query) {
              characterController.searchCharacters(query);
            },
            onSubmitted: (query) {
              characterController.searchCharacters(query);
              controller.searchController.clear();
            },
          ),
          Expanded(
            child: Obx(() {
              final _ = characterController.filteredCharacters.length;

              if (characterController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (characterController.filteredCharacters.isEmpty) {
                final hasCharacter =
                    characterController.filteredCharacters.isNotEmpty;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hasCharacter
                          ? 'No hay coincidencias con tu búsqueda.'
                          : 'No se encontraron personajes.',
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
                        homeController.searchController.clear();
                      },
                      child: const Text(
                        'Volver a ver todos',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                );
              }

              return screenWidth > 900
                  ? Center(
                      child: HorizontalCharacterList(
                        characters: characterController.filteredCharacters,
                      ),
                    )
                  : GridCharacterList(
                      characters: characterController.filteredCharacters,
                    );
            }),
          ),
        ],
      ),
    );
  }
}
