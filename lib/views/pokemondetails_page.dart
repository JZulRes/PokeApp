import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/services/string_service.dart';
import 'package:pokeapp/widgets/card_pokemondetails.dart';

StringService stringService = StringService();

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon? pokemon;
  const PokemonDetailsPage({super.key, this.pokemon});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 50),
          child: CardPokemonDetails(pokemon: widget.pokemon),
        ),
      ),
    );
  }
}
