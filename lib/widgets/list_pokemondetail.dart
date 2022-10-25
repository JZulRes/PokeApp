import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/services/string_service.dart';

StringService stringService = StringService();

class ListPokemonDetails extends StatelessWidget {
  final Pokemon? pokemon;
  const ListPokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: pokemon!.abilities!.length,
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
                  stringService.capitalizeOnlyFirstLater(pokemon!.abilities![index].ability!.name.toString()),
                  style: const TextStyle(
                    color: Color(0xFF2a3050),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
