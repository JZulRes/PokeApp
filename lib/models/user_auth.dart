import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  Future singIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future singUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  bool activeUser() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    return true;
  }

  String getUserEmail() {
    String userEmail = FirebaseAuth.instance.currentUser!.email ?? 'sin correo';
    return userEmail;
  }
}
