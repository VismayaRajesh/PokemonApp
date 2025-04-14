import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../core/constants/app_color.dart';
import '../../model/pokemon_details_model.dart';

class PokemonHeaderSection extends StatefulWidget {
  final PokemonsDetailsModel pokemon;
  final Color typeColor;

  const PokemonHeaderSection({
    Key? key,
    required this.pokemon,
    required this.typeColor,
  }) : super(key: key);

  @override
  State<PokemonHeaderSection> createState() => _PokemonHeaderSectionState();
}

class _PokemonHeaderSectionState extends State<PokemonHeaderSection> {
  Color? bgColor;
  List<String> imageUrls = [];
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _prepareImages();
    _updatePalette();
    _pageController = PageController();
  }

  void _prepareImages() {
    final sprites = widget.pokemon.sprites;

    final urls = [
      sprites?.other?.officialArtwork?.frontDefault,
      sprites?.other?.showdown?.backDefault,
      sprites?.other?.officialArtwork?.frontShiny,
      sprites?.other?.showdown?.backShiny,
    ];

    // Remove null or empty entries
    imageUrls = urls.whereType<String>().where((url) => url.isNotEmpty).toList();
  }

  Future<void> _updatePalette() async {
    final imageUrl = widget.pokemon.sprites?.other?.officialArtwork?.frontDefault ??
        widget.pokemon.sprites?.frontDefault;

    if (imageUrl == null) return;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
      size: const Size(200, 200),
    );

    setState(() {
      final dominantColor = paletteGenerator.dominantColor?.color;
      if (dominantColor != null) {
        bgColor = dominantColor.withOpacity(0.25);
      } else {
        bgColor = widget.typeColor.withOpacity(0.2); // fallback
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor ?? widget.typeColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: imageUrls.isEmpty
            ? const Center(child: Text("No Images Available"))
            : Column(
          children: [
            // Image Slider
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final imageUrl = imageUrls[index];
                  return Hero(
                    tag: 'pokemon-${widget.pokemon.id}-$index',
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        // Inner yellow border for image
                        border: Border.all(color: AppColors.yellow, width: 3),
                        borderRadius: BorderRadius.circular(16), // Inner rounded corners
                        // Outer shadow to complement the yellow border
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.yellow.withOpacity(0.2)
                                : Colors.yellow.withOpacity(0.4),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const SizedBox(
                          height: 200,
                          width: 200,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error, size: 100),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Page Indicator (Dots)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageUrls.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 12 : 8,
                    height: 9,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? AppColors.yellow : AppColors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
