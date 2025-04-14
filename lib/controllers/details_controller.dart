import 'package:get/get.dart';
import '../model/pokemon_details_model.dart';
import '../services/pokemon_api_service.dart';

class PokemonDetailsController extends GetxController {
  final int id;

  PokemonDetailsController(this.id);

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var pokemonDetails = Rxn<PokemonsDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  void fetchDetails() async {
    try {
      final data = await DetailApiservice().fetchPokemonDetails(id);
      pokemonDetails.value = data;
    } catch (e) {
      errorMessage.value = 'Failed to load Pokémon details';
      print('Error fetching Pokémon details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

