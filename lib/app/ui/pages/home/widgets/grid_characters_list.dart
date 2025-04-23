import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/character_image.dart';
import '../../../../data/model/character_model.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/animated_character_card.dart';

class GridCharacterList extends StatelessWidget {
  final List<Character> characters;

  const GridCharacterList({
    super.key,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    // final CharacterController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          final character = characters[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed('/details', arguments: character);
            },
            child: AnimatedCharacterCard(
              name: character.name,
              imagePath: getCharacterImage(character.name),
            ),
          );
        },
      ),
    );
  }
}
