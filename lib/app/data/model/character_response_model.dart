import 'package:starwars_characters_explorer_flutter/app/data/model/character_model.dart';

class CharactersResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Character> results;

  CharactersResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Character>.from(
        json['results'].map((x) => Character.fromJson(x)),
      ),
    );
  }
}
