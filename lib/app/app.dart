import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starwars_characters_explorer_flutter/app/bindings/home_binding.dart';
import 'package:starwars_characters_explorer_flutter/app/ui/themes/dark_theme.dart';

import 'routes/app_pages.dart';

class StarsWarCharactersApp extends StatelessWidget {
  const StarsWarCharactersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Star Wars Characters',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.homeRoute,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
