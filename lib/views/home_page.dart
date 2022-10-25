import 'package:flutter/material.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapp/services/string_service.dart';
import 'package:pokeapp/widgets/gridview_pokemonhome.dart';
import 'package:pokeapp/widgets/popupmenu_pokemonhome.dart';

enum Menu { itemOne, itemTwo, itemThree }

StringService stringService = StringService();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          PopUpMenuHome(),
        ],
        title: const Text('Lista de Pokemons'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
              future: PokeAPI.getObjectList<Pokemon>(1, 20),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Pokemon?>? pokemonList = snapshot.data;
                  return GridViewPokemonDetails(
                    pokemonList: pokemonList!,
                  );
                } else {
                  return AlertDialog(
                    backgroundColor: Colors.blueGrey.shade100,
                    title: const Text('Cargando...'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
