import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controllers/listapi_controller.dart';
import '../../page/pokemon_details_page.dart';
import 'package:pokemon_app/utils/string_extensions.dart';

class PokemonListWidget extends StatelessWidget {
  PokemonListWidget({Key? key}) : super(key: key);

  final controller = Get.find<ListapiController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !controller.isLoading.value &&
          controller.hasMore.value) {
        controller.loadPokemons();
      }
    });

    return Obx(() {
      return SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListView.separated(
              itemCount: controller.filteredList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final pokemon = controller.filteredList[index];
                final originalIndex = controller.pokemonList.indexOf(pokemon);

                final url = pokemon.url;
                final id = url.split('/')[6];
                final imageUrl =
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";

                return GestureDetector(
                  onTap: () {
                    Get.to(() => PokemonDetailsPage(id: int.parse(id)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (originalIndex != -1 && originalIndex < controller.bgColors.length)
                          ? controller.bgColors[originalIndex] ?? Colors.grey[200]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (controller.isLoading.value)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      );
    });
  }
}
