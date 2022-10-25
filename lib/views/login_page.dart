// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pokeapp/services/user_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

UserAuth userAuth = UserAuth();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  void checkUser() {
    setState(() {
      if (userAuth.activeUser() == false) {
        Alert(context: context, title: 'Login Fallido', desc: 'Revisa tu contraseña o usuario').show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(
                  image: AssetImage('images/Pokemon_logo.png'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu correo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tu correo no puede ir vacio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tienes que ingresar una contraseña';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userAuth.singIn(email!, password!).then((value) => checkUser());
                    }
                  },
                  child: const Text('Ingresar'),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginpage/registeruser');
                  },
                  child: const Text('Crear cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
