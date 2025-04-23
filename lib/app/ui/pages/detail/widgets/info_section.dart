import 'package:flutter/material.dart';

import 'package:starwars_characters_explorer_flutter/app/ui/utils/traslate.dart';
import 'package:starwars_characters_explorer_flutter/app/data/model/character_model.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/detail/widgets/info_line.dart';

class InfoSection extends StatelessWidget {
  final Character character;

  const InfoSection({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          character.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        InfoLine(
          label: 'Género',
          value: translateGender(character.gender),
        ),
        InfoLine(
          label: 'Altura',
          value: '${character.height} cm',
        ),
        InfoLine(
          label: 'Color de piel',
          value: translateSkinColor(character.skinColor),
        ),
      ],
    );
  }
}
