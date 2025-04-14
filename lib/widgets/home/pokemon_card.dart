import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon_app/utils/string_extensions.dart';

class PokemonCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
    this.onTap,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  Color bgColor = Colors.grey.shade200;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
    await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
      size: const Size(200, 200),
    );

    setState(() {
      final dominantColor = paletteGenerator.dominantColor?.color;
      if (dominantColor != null) {
        bgColor = dominantColor.withOpacity(0.25);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(
              widget.name.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
