import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/controllers/gridapi_controller.dart';
import 'package:pokemon_app/widgets/home/pokemon_card.dart';
import '../../page/pokemon_details_page.dart';

class PokemonGridWidget extends StatelessWidget {
  PokemonGridWidget({super.key});

  final controller = Get.find<GridapiController>();
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 22),
              itemCount: controller.pokemonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final pokemon = controller.pokemonList[index];
                final url = pokemon.url;
                final id = url.split('/')[6];
                final imageUrl =
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";

                return PokemonCard(
                  name: pokemon.name,
                  imageUrl: imageUrl,
                  onTap: () {
                    Get.to(() => PokemonDetailsPage(id: int.parse(id)));
                  },
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
