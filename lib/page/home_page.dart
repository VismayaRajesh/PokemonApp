import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../widgets/home/pokemon_grid_widget.dart';
import '../../widgets/home/pokemon_list_widget.dart';
import '../core/constants/app_string.dart';
import '../widgets/home/search_bar_with_toggle.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.homePageAppBarTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.homePageTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              SearchBarWithToggle(controller: controller),
              Expanded(
                child: Obx(
                      () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: controller.isGrid.value
                        ?  PokemonGridWidget(key: ValueKey('grid'))
                        : PokemonListWidget(key: ValueKey('list')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
