import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GridapiController extends GetxController {
  final _apiService = PokemonApiService();

  var pokemonList = <dynamic>[].obs;
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
      offset.value += limit;
      isLoading.value = false;
    } else {
      hasMore.value = false;
      isLoading.value = false;
    }
  }
}
