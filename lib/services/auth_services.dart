import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static User? get user {
    return FirebaseAuth.instance.currentUser;
  }

  static bool get isLoogedIn => user != null;

  static Future register(var email, var password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (err) {
      print(err);
    }
  }

  static Future login(var email, var password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (err) {
      print(err);
    }
  }

  static Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (err) {
      print(err);
    }
  }
}
