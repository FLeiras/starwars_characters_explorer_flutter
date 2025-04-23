import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController controller;

  const SearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: (value) {
          onSubmitted?.call(value);
          controller.clear();
          focusNode.unfocus();
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        ),
      ),
    );
  }
}
