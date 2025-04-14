import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pokemon_app/controllers/gridapi_controller.dart';
import 'package:pokemon_app/controllers/home_controller.dart';

import '../controllers/details_controller.dart';
import '../controllers/listapi_controller.dart';

class PokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ListapiController>(() => ListapiController());
    Get.lazyPut<GridapiController>(() => GridapiController());
  }
}