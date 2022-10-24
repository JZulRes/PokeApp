import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokeapp/models/user_auth.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

enum Menu { itemOne, itemTwo, itemThree }

UserAuth userAuth = UserAuth();

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
        actions: [
          PopupMenuButton(
              // Callback that sets the selected popup menu item.
              onSelected: (item) {
                setState(() {
                  if (item.name == 'itemOne') {
                    FirebaseAuth.instance.signOut();
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem(
                      value: Menu.itemOne,
                      child: Row(
                        children: const [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Cerrar sesion'),
                        ],
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Row(
                        children: const [
                          Icon(Icons.dark_mode),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Cambiar de tema')
                        ],
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text(userAuth.getUserEmail()),
                    ),
                  ]),
        ],
        backgroundColor: Colors.white,
        title: const Text('Lista de Pokemons'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
              future: PokeAPI.getObjectList<Pokemon>(1, 30),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Pokemon?>? pokemonList = snapshot.data;
                  return gridBuilder(pokemonList!);
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

  GridView gridBuilder(List<Pokemon?> pokemonList) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList[index]?.id}.png'),
                  height: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  pokemonList[index]?.name.toString() ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
