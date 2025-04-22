import 'package:get/get.dart';
import 'package:starwars_characters_explorer_flutter/app/data/model/character_response_model.dart';

class CharacterService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://swapi.py4e.com/api';
  }

  Future<CharactersResponse> fetchCharacters() async {
    final response = await get('/people/');
    if (response.status.hasError) {
      throw Exception('Failed to load characters: ${response.statusText}');
    }

    return CharactersResponse.fromJson(response.body);
  }
}
