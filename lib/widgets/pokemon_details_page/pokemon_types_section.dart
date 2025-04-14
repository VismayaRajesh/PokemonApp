import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';
import '../../utils/string_extensions.dart';
import '../../model/pokemon_details_model.dart' as model;

class PokemonTypesSection extends StatelessWidget {

  final List<model.Type> types;
  final Color Function(String) getTypeColor;

  const PokemonTypesSection({
    Key? key,
    required this.types,
    required this.getTypeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Types',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.black,),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: types.map((type) {
              final typeName = type.type?.name ?? 'unknown';
              return Chip(
                label: Text(
                  typeName.capitalize(),
                  style: const TextStyle(color: AppColors.white),
                ),
                backgroundColor: getTypeColor(typeName),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : Colors.transparent, // Border color
                    width: 1,             // Border width
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
