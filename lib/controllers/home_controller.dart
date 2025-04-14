import 'package:get/get.dart';

class HomeController extends GetxController {
  var isGrid = true.obs;

  void toggleView(bool grid) {
    isGrid.value = grid;
  }
}
