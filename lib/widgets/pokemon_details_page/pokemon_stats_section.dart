import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../model/pokemon_details_model.dart';

class PokemonStatsSection extends StatelessWidget {
  final List<Stat> stats;
  final Color Function(String?) getStatColor;
  final String Function(String?) getStatName;

  const PokemonStatsSection({
    Key? key,
    required this.stats,
    required this.getStatColor,
    required this.getStatName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Base Stats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
            color:Theme.of(context).brightness == Brightness.dark
                ? AppColors.white
                : AppColors.black,),
          ),
          const SizedBox(height: 16),
          ...stats.map((stat) {
            final baseStat = stat.baseStat ?? 0;
            final statName = stat.stat?.name;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getStatName(statName),
                        style:  TextStyle(fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.white
                                : AppColors.black
                        ),
                      ),
                      Text(
                        baseStat.toString(),
                        style:  TextStyle(fontWeight: FontWeight.w500,
                           color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.white
                                : AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: baseStat / 100,
                    backgroundColor: Colors.grey[500],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      getStatColor(statName),
                    ),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
