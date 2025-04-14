import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../model/pokemon_details_model.dart';

class PokemonPhysicalAttributesSection extends StatelessWidget {
  final PokemonsDetailsModel pokemon;

  const PokemonPhysicalAttributesSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightInMeters = (pokemon.height ?? 0) / 10;
    final weightInKg = (pokemon.weight ?? 0) / 10;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPhysicalAttribute(context,'Height', '$heightInMeters m'),
          Container(
            height: 40,
            width: 1,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12))
            ),
          _buildPhysicalAttribute(context,'Weight', '$weightInKg kg'),
        ],
      ),
    );
  }

  Widget _buildPhysicalAttribute(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style:  TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.white
              : AppColors.black,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.white
                  : AppColors.black),
        ),
      ],
    );
  }
}
