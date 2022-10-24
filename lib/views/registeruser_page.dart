// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pokeapp/models/user_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

UserAuth userAuth = UserAuth();

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  String? email;
  String? password;
  final _formKey2 = GlobalKey<FormState>();

  void checkUser() {
    setState(() {
      if (userAuth.activeUser() == false) {
        Alert(context: context, title: 'Login Fallido', desc: 'Revisa tu contraseña o correo, contraseña minimo de 6 digitos').show();
      } else {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
        elevation: 0,
      ),
      body: Form(
        key: _formKey2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Registrate',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tu correo no puede ir vacio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Escribe tu correo',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tienes que ingresar una contraseña';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Escribe tu contraseña',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey2.currentState!.validate()) {
                      UserAuth().singUp(email!, password!).then((value) => checkUser());
                    }
                  },
                  child: const Text('Crear usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
