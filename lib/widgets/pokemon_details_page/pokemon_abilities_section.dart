import 'package:flutter/material.dart';
import '../../utils/string_extensions.dart';
import '../../model/pokemon_details_model.dart';

class PokemonAbilitiesSection extends StatelessWidget {
  final List<Ability> abilities;

  const PokemonAbilitiesSection({Key? key, required this.abilities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Abilities',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: abilities.map((ability) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 6),
                    decoration:  BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    ability.ability?.name?.capitalize().replaceAll('-', ' ') ??
                        'Unknown ability',
                    style:  TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
