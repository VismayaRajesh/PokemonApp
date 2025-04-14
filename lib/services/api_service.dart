import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Pokemon_list_model.dart';

class PokemonApiService {
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Pokemonmodel?> fetchPokemons({int offset = 0, int limit = 20}) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?offset=$offset&limit=$limit'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Pokemonmodel(
          count: data['count'],
          next: data['next'],
          previous: data['previous'],
          results: (data['results'] as List)
              .map((item) => Result(name: item['name'], url: item['url']))
              .toList(),
        );
      } else {
        print('Failed to load Pokémon list. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching Pokémon list: $e');
      return null;
    }
  }
}