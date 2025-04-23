import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/character_image.dart';
import 'package:starwars_characters_explorer_flutter/app/data/model/character_model.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/global_widgets/custom_navbar.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/detail/widgets/info_section.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments;

    return Scaffold(
      body: Column(
        children: [
          const CustomNavbar(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16),
                    child: isWide
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                getCharacterImage(character.name),
                                height: 300,
                              ),
                              const SizedBox(width: 40),
                              InfoSection(character: character),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                getCharacterImage(character.name),
                                height: 250,
                              ),
                              const SizedBox(height: 24),
                              InfoSection(character: character),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
