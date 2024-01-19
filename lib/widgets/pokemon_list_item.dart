import 'package:flutter/material.dart';
import 'package:pokemon_long_list/widgets/pokemon_widget.dart';

import '../models/pokemon_list_response/result.dart';


class PokemonListItem extends StatelessWidget {
  const PokemonListItem({super.key, required this.pokemonList});

  final List<Result>? pokemonList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonList!.length,
      prototypeItem: const ListTile(
        title: Text('Pokemon List'),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          leading: PokemonWidget(index: pokemonList![index].name.toString()),
          title: Text(pokemonList![index].name.toString()),
        );
      },
    );
  }
}
