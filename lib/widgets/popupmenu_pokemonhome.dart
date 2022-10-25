import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokeapp/services/user_auth.dart';

enum Menu { itemOne, itemTwo, itemThree }

UserAuth userAuth = UserAuth();

class PopUpMenuHome extends StatefulWidget {
  const PopUpMenuHome({super.key});

  @override
  State<PopUpMenuHome> createState() => _PopUpMenuHomeState();
}

class _PopUpMenuHomeState extends State<PopUpMenuHome> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (item) {
        setState(
          () {
            if (item.name == 'itemOne') {
              FirebaseAuth.instance.signOut();
            }
          },
        );
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
        PopupMenuItem(
          value: Menu.itemThree,
          child: Text(userAuth.getUserEmail()),
        )
      ],
    );
  }
}
