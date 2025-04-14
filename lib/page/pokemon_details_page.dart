import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/utils/pokemon_helpers.dart';
import '../controllers/details_controller.dart';
import '../widgets/pokemon_details_page/backbtn.dart';
import '../widgets/pokemon_details_page/pokemon_abilities_section.dart';
import '../widgets/pokemon_details_page/pokemon_header_section.dart';
import '../widgets/pokemon_details_page/pokemon_physical_attributes_section.dart';
import '../widgets/pokemon_details_page/pokemon_stats_section.dart';
import '../widgets/pokemon_details_page/pokemon_types_section.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int id;

  const PokemonDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PokemonDetailsController(id));
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      if (controller.errorMessage.isNotEmpty) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(child: Text(controller.errorMessage.value)),
        );
      }

      final pokemon = controller.pokemonDetails.value;
      if (pokemon == null) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: Text('No Pokémon data available')),
        );
      }

      final primaryType = pokemon.types.isNotEmpty
          ? pokemon.types[0].type?.name ?? 'normal'
          : 'normal';
      final typeColor = getTypeColor(primaryType);

      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            leading: Backbtn(),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pokemon.name!.capitalize!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pokemon.id.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.grey[400] : Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonHeaderSection(pokemon: pokemon, typeColor: typeColor),
                const SizedBox(height: 14),
                PokemonPhysicalAttributesSection(pokemon: pokemon),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(height: 20),
                PokemonTypesSection(
                  types: pokemon.types,
                  getTypeColor: getTypeColor,
                ),
                const SizedBox(height: 20),
                PokemonStatsSection(
                  stats: pokemon.stats,
                  getStatColor: getStatColor,
                  getStatName: getStatName,
                ),
                const SizedBox(height: 20),
                PokemonAbilitiesSection(
                  abilities: pokemon.abilities,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    });
  }
}
