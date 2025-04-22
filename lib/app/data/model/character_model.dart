class Character {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<dynamic> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  Character copyWith({
    String? name,
    String? height,
    String? mass,
    String? hairColor,
    String? skinColor,
    String? eyeColor,
    String? birthYear,
    String? gender,
    String? homeworld,
    List<String>? films,
    List<dynamic>? species,
    List<String>? vehicles,
    List<String>? starships,
    DateTime? created,
    DateTime? edited,
    String? url,
  }) =>
      Character(
        name: name ?? this.name,
        height: height ?? this.height,
        mass: mass ?? this.mass,
        hairColor: hairColor ?? this.hairColor,
        skinColor: skinColor ?? this.skinColor,
        eyeColor: eyeColor ?? this.eyeColor,
        birthYear: birthYear ?? this.birthYear,
        gender: gender ?? this.gender,
        homeworld: homeworld ?? this.homeworld,
        films: films ?? this.films,
        species: species ?? this.species,
        vehicles: vehicles ?? this.vehicles,
        starships: starships ?? this.starships,
        created: created ?? this.created,
        edited: edited ?? this.edited,
        url: url ?? this.url,
      );

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<dynamic>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };

  @override
  String toString() {
    return 'CharacterResponse('
        'name: $name, '
        'height: $height, '
        'mass: $mass, '
        'hairColor: $hairColor, '
        'skinColor: $skinColor, '
        'eyeColor: $eyeColor, '
        'birthYear: $birthYear, '
        'gender: $gender, '
        'homeworld: $homeworld, '
        'films: $films, '
        'species: $species, '
        'vehicles: $vehicles, '
        'starships: $starships, '
        'created: $created, '
        'edited: $edited, '
        'url: $url'
        ')';
  }
}
