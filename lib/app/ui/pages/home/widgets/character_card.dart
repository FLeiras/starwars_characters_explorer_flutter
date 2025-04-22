import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/favorites_controllers.dart';

class CharacterCard extends StatefulWidget {
  final String name;
  final String imagePath;

  const CharacterCard({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  CharacterCardState createState() => CharacterCardState();
}

class CharacterCardState extends State<CharacterCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    final isHomePage = Get.currentRoute == '/home';

    return Obx(() {
      final isFavorite = favoritesController.isFavorite(widget.name);

      return MouseRegion(
        onEnter: isHomePage ? (_) => _controller.forward() : null,
        onExit: isHomePage ? (_) => _controller.reverse() : null,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: isHomePage ? _scaleAnimation.value : 1.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          final wasFavorite =
                              favoritesController.isFavorite(widget.name);
                          favoritesController.toggleFavorite(widget.name);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  wasFavorite ? Colors.red : Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: Text(
                                wasFavorite
                                    ? '${widget.name} fue quitado de favoritos 💔'
                                    : '${widget.name} agregado a favoritos ❤️',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
