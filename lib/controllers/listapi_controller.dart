import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../services/api_service.dart';

class ListapiController extends GetxController {
  final _apiService = PokemonApiService();

  var pokemonList = <dynamic>[].obs;
  var bgColors = <Color?>[].obs;
  var offset = 0.obs;
  final int limit = 10;
  var isLoading = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadPokemons();
  }

  void loadPokemons() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    final data = await _apiService.fetchPokemons(offset: offset.value, limit: limit);
    if (data != null && data.results.isNotEmpty) {
      pokemonList.addAll(data.results);
      bgColors.addAll(List<Color?>.filled(data.results.length, null));
      offset.value += limit;
      isLoading.value = false;

      for (int i = offset.value - limit; i < pokemonList.length; i++) {
        final id = pokemonList[i].url?.split('/')[6];
        final imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
        updatePalette(i, imageUrl);
      }
    } else {
      hasMore.value = false;
      isLoading.value = false;
    }
  }

  Future<void> updatePalette(int index, String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        size: const Size(200, 200),
      );
      final dominantColor = paletteGenerator.dominantColor?.color;
      if (dominantColor != null) {
        bgColors[index] = dominantColor.withOpacity(0.25);
        refresh();
      }
    } catch (e) {
    }
  }
}
