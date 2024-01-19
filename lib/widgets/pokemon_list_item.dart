import 'package:flutter/material.dart';
import 'package:pokemon_long_list/models/pokemon_list_response/pokemon_list_response.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({super.key, required this.pokemonList});

  final PokemonListResponse pokemonList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonList.results!.length,
      prototypeItem: const ListTile(
        title: Text('Pokemon List'),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(pokemonList.results![index].toString()),
        );
      },
    );
  }
}
