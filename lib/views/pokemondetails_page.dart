import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/services/string_service.dart';

StringService stringService = StringService();

class PokemonDetails extends StatefulWidget {
  final Pokemon? pokemonList;

  const PokemonDetails({super.key, this.pokemonList});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
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
          child: pokemonDetailsCard(widget.pokemonList),
        ),
      ),
    );
  }

  Card pokemonDetailsCard(Pokemon? pokemonList) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color(0xFF2a3050),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList?.id}.png',
              height: 200,
            ),
            Text(
              stringService.capitalizeOnlyFirstLater(pokemonList?.name.toString() ?? ''),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pokemonList!.abilities!.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFf7b916),
                      ),
                      child: Center(
                        child: Text(
                          stringService.capitalizeOnlyFirstLater(pokemonList.abilities![index].ability!.name.toString()),
                          style: const TextStyle(
                            color: Color(0xFF2a3050),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
