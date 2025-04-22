# Changelog

All notable changes to this project will be documented in this file.

## [0.2.0] - 2025-04-22
### Added
- Created a responsive Custom Navigation Bar for Flutter Web.
- Implemented reusable `CharacterCard` widget with optional image zoom on hover (only in home).
- Integrated static images for characters using a local asset switch.
- Added "Favorites" feature with persistent local storage using `get_storage`.
- Created custom reusable `CustomButton` widget with icon, label, and onTap handler.
- Included visual feedback with animated favorite icon and SnackBar messages.
- Cards now scroll horizontally with subtle right arrow as scroll hint.
- Route-aware logic for title and navigation button visibility.
- Applied animated scaling effect on hover (only in Home).

### Changed
- Replaced AppBar with CustomNavbar for better web layout experience.
- Replaced `GridView` with `ListView` for horizontal card scrolling.

## [0.1.0] - 2025-04-21
### Added
- Initial project created with `flutter create`.
- Base configuration for Flutter Web.
- Initial folder and file structure for the repository.
