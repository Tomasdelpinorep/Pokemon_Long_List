import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokemon_long_list/models/pokemon_response/pokemon_response.dart';
import 'package:pokemon_long_list/widgets/pokemon_item.dart';

Future<PokemonResponse> fetchPokemon(String index) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PokemonResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load any pokemon.');
  }
}

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({super.key, required this.index});
  final String index;

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  late Future<PokemonResponse> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonResponse>(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PokemonItem(pokemon : snapshot.data!, index : snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}