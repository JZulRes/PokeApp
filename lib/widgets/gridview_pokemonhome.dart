import 'package:pokeapp/services/string_service.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/views/pokemondetails_page.dart';

StringService stringService = StringService();

class GridViewPokemonDetails extends StatelessWidget {
  final List<Pokemon?> pokemonList;
  const GridViewPokemonDetails({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  return PokemonDetailsPage(pokemon: pokemonList[index]);
                }),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList[index]?.id}.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    stringService.capitalizeOnlyFirstLater(pokemonList[index]?.name.toString() ?? ''),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
