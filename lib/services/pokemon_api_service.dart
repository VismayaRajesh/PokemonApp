import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/pokemon_details_model.dart';

class DetailApiservice {
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';


  Future<PokemonsDetailsModel> fetchPokemonDetails(int id) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/$id';
    print('Fetching from URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return PokemonsDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }

}
