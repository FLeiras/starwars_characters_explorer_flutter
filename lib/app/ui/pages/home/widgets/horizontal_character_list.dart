import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/character_image.dart';
import '../../../../data/model/character_model.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/animated_character_card.dart';

class HorizontalCharacterList extends StatefulWidget {
  final List<Character> characters;

  const HorizontalCharacterList({
    super.key,
    required this.characters,
  });

  @override
  State<HorizontalCharacterList> createState() =>
      _HorizontalCharacterListState();
}

class _HorizontalCharacterListState extends State<HorizontalCharacterList> {
  final scrollController = ScrollController();

  void scrollLeft() {
    scrollController.animateTo(
      scrollController.offset - 250,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollRight() {
    scrollController.animateTo(
      scrollController.offset + 250,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: SizedBox(
            height: 280,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.characters.length,
              itemBuilder: (context, index) {
                final character = widget.characters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/details', arguments: character);
                    },
                    child: AnimatedCharacterCard(
                      name: character.name,
                      imagePath: getCharacterImage(character.name),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.chevron_left, size: 32),
              onPressed: scrollLeft,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.chevron_right, size: 32),
              onPressed: scrollRight,
            ),
          ),
        ),
      ],
    );
  }
}
