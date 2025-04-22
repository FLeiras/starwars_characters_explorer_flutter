import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starwars_characters_explorer_flutter/app/ui/pages/home/widgets/custom_button.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final String currentRoute = Get.currentRoute;

    //! Determino el título según la ruta

    String title = 'Star Wars Characters';
    if (currentRoute == '/favorites') {
      title = 'Favoritos';
    }

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isSmallScreen)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                if (value == 'home') {
                  Get.toNamed('/home');
                } else if (value == 'favorites') {
                  Get.toNamed('/favorites');
                }
              },
              itemBuilder: (BuildContext context) {
                final currentRoute = Get.currentRoute;
                return <PopupMenuEntry<String>>[
                  if (currentRoute != '/home')
                    const PopupMenuItem<String>(
                      value: 'home',
                      child: Text('Inicio'),
                    ),
                  if (currentRoute != '/favorites')
                    const PopupMenuItem<String>(
                      value: 'favorites',
                      child: Text('Favoritos'),
                    ),
                ];
              },
            )
          else
            Row(
              children: [
                if (currentRoute != '/home')
                  CustomButton(
                    label: 'Inicio',
                    icon: Icons.home,
                    onTap: () {
                      Get.toNamed('/home');
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                if (currentRoute != '/favorites') ...[
                  const SizedBox(width: 12),
                  CustomButton(
                    label: 'Favoritos',
                    icon: Icons.favorite,
                    onTap: () {
                      Get.toNamed('/favorites');
                    },
                    color: Colors.yellow.shade700,
                    textColor: Colors.black,
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}
