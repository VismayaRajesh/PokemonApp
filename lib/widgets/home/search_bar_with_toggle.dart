import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pokemon_app/widgets/home/view_toggle_button.dart';

import '../../controllers/home_controller.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_string.dart';

class SearchBarWithToggle extends StatelessWidget {
  final HomeController controller;
  final TextEditingController searchController;
  final Function(String) onSearchChanged;

  const SearchBarWithToggle({
    super.key,
    required this.controller,
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 50,
            child: Row(
              children: [
                const Icon(LucideIcons.search, color: AppColors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: onSearchChanged,
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
              onViewChanged: controller.toggleView,
              initialView: controller.isGrid.value,
              constraints: constraints,
            );
          },
        ),
      ],
    );
  }
}
