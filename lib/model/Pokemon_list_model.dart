import 'dart:ui';

class Pokemonmodel {
  Pokemonmodel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result> results;

}

class Result {
  Result( {
    required this.name,
    required this.url,

  });

  final String? name;
  final String? url;

}
