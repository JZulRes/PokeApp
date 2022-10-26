import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/views/login_page.dart';
import 'package:pokeapp/views/registeruser_page.dart';
import 'package:pokeapp/views/home_page.dart';
import 'package:pokeapp/themes/app_theme.dart';

ThemeApp themeApp = ThemeApp();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: themeApp.darkTheme(),
      theme: themeApp.lightTheme(),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
      routes: {
        '/loginpage/registeruser': (context) => const RegisterUserPage(),
      },
    );
  }
}
