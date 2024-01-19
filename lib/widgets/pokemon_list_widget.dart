import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_long_list/models/pokemon_list_response/pokemon_list_response.dart';
import 'package:pokemon_long_list/widgets/pokemon_list_item.dart';

Future<PokemonListResponse> fetchPokemonList() async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10000&offset=0'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PokemonListResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load any pokemon.');
  }
}

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  late Future<PokemonListResponse> futurePokemonList;

  @override
  void initState() {
    super.initState();
    futurePokemonList = fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonListResponse>(
      future: futurePokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PokemonListItem(pokemonList : snapshot.data!.results);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
