import 'package:flutter/material.dart';

Color getTypeColor(String type) {
  switch (type) {
    case 'grass':
      return Colors.green;
    case 'fire':
      return Colors.red;
    case 'water':
      return Colors.blue;
    case 'electric':
      return Colors.yellow[700]!;
    case 'psychic':
      return Colors.purple;
    case 'ice':
      return Colors.lightBlue;
    case 'dragon':
      return Colors.indigo;
    case 'dark':
      return Colors.brown;
    case 'fairy':
      return Colors.pink;
    case 'normal':
      return Colors.grey;
    case 'fighting':
      return Colors.orange;
    case 'flying':
      return Colors.lightBlue[300]!;
    case 'poison':
      return Colors.purple[800]!;
    case 'ground':
      return Colors.brown[400]!;
    case 'rock':
      return Colors.brown[600]!;
    case 'bug':
      return Colors.lightGreen[500]!;
    case 'ghost':
      return Colors.deepPurple;
    case 'steel':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}

Color getStatColor(String? statName) {
  switch (statName) {
    case 'hp':
      return Colors.green;
    case 'attack':
      return Colors.red;
    case 'defense':
      return Colors.blue;
    case 'special-attack':
      return Colors.purple;
    case 'special-defense':
      return Colors.blue[800]!;
    case 'speed':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

String getStatName(String? statName) {
  switch (statName) {
    case 'hp':
      return 'HP';
    case 'attack':
      return 'Attack';
    case 'defense':
      return 'Defense';
    case 'special-attack':
      return 'Sp. Atk';
    case 'special-defense':
      return 'Sp. Def';
    case 'speed':
      return 'Speed';
    default:
      return statName ?? 'Unknown';
  }
}
