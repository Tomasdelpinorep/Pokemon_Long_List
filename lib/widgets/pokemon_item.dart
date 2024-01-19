import 'package:flutter/material.dart';
import 'package:pokemon_long_list/models/pokemon_response/pokemon_response.dart';



class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.pokemon, required this.index});

  final PokemonResponse pokemon;
  final String? index;

  @override
  Widget build(BuildContext context) {
    return Image.network(pokemon.sprites!.frontDefault!);
  }
}
