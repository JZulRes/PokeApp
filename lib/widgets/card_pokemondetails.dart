import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/services/string_service.dart';
import 'package:pokeapp/widgets/list_pokemondetail.dart';

StringService stringService = StringService();

class CardPokemonDetails extends StatelessWidget {
  final Pokemon? pokemon;
  const CardPokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2a3050),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon?.id}.png',
              height: 200,
            ),
            Text(
              stringService.capitalizeOnlyFirstLater(pokemon?.name.toString() ?? ''),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListPokemonDetails(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
