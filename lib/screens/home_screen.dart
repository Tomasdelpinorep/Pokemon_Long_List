import 'package:flutter/material.dart';
import 'package:pokemon_long_list/widgets/pokemon_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PokemonListWidget(),
      ),
    );
  }
}
