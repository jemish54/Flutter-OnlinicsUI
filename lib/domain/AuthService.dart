import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        return "LoggedIn";
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "Error";
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        return "LoggedIn";
      } on FirebaseAuthException catch (e) {
        return e.message!;
      }
    }
    return "Error";
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
