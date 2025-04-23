import 'package:get/get.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/detail/character_detail.dart';

import '../ui/pages/home/home_page.dart';
import 'package:starwars_characters_explorer_flutter/app/bindings/character_binding.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/pages/favorites/favorites_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.homeRoute,
      page: () => HomePage(),
      binding: CharacterBinding(),
    ),
    GetPage(
      name: Routes.favoritesRoute,
      page: () => FavoritesPage(),
      binding: CharacterBinding(),
    ),
    GetPage(
      name: Routes.detailsRoute,
      page: () => CharacterDetail(),
    )
  ];
}
