import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/animated_character_card.dart';

// import 'character_card.dart';
import '../../../utils/character_image.dart';
import '../../../../controllers/character_controller.dart';

class GridCharacterList extends StatelessWidget {
  const GridCharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: controller.characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          final character = controller.characters[index];
          return AnimatedCharacterCard(
            name: character.name,
            imagePath: getCharacterImage(character.name),
          );
        },
      ),
    );
  }
}
