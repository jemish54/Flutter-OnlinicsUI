import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();

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

  Future<void> signInWithGoogle() async {
    final googleuser = await _googleAuth.signIn();
    if (googleuser != null) {
      final user = await googleuser.authentication;
      if (user.idToken != null) {
        await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: user.idToken, accessToken: user.idToken),
        );
      }
    } else {
      throw FirebaseAuthException(code: "ABORTED BY USER");
    }
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
    await _googleAuth.signOut();
    await _auth.signOut();
  }
}
