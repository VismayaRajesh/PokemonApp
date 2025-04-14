import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constants/app_icons.dart';

import '../../../controllers/home_controller.dart';
import '../../core/constants/app_string.dart';
import 'view_toggle_button.dart';

class SearchBarWithToggle extends StatelessWidget {
  final HomeController controller;

  const SearchBarWithToggle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isDark? Colors.grey[900] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 50,
            child: Row(
              children: [
                const Icon(AppIcon.searchh, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppStrings.homePageSearchBarTitle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            return ViewToggleButton(
              onViewChanged: (isGrid) {
                controller.toggleView(isGrid);
              },
              initialView: controller.isGrid.value,
              constraints: constraints,
            );
          },
        ),
      ],
    );
  }
}
