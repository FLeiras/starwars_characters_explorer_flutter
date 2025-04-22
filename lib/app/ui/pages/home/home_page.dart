import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starwars_characters_explorer_flutter/app/controllers/home_controller.dart';
import 'package:starwars_characters_explorer_flutter/app/controllers/character_controller.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/custom_navbar.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/horizontal_character_list.dart';

import 'widgets/grid_characters_list.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController controller = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          const CustomNavbar(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.characters.isEmpty) {
                return const Center(child: Text('No characters found.'));
              }

              return screenWidth > 900
                  ? Center(child: const HorizontalCharacterList())
                  : const GridCharacterList();
            }),
          ),
        ],
      ),
    );
  }
}
