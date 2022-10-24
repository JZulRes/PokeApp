import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/views/login_page.dart';
import 'package:pokeapp/views/registeruser_page.dart';
import 'package:pokeapp/views/home_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 15),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 20),
          headline2: TextStyle(color: Colors.black, fontSize: 20),
          bodyText2: TextStyle(color: Colors.black, fontSize: 15),
          subtitle1: TextStyle(color: Colors.black, fontSize: 15),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
      ),
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
        '/loginpage': (context) => const LoginPage(),
        '/loginpage/registeruser': (context) => const RegisterUserPage(),
        '/loginpage/pokepage': (context) => const HomePage(),
      },
    );
  }
}
