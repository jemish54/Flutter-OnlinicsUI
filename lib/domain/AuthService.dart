import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<UserCredential?> logIn({
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        var user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        return user;
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
    required String contact,
    required String age,
    String? appointments,
    String? height,
    String? weight,
    String? gender,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        var user = await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => FirebaseFirestore.instance
                    .collection('Users')
                    .doc(value.user?.uid)
                    .set({
                  "email": email,
                  "username": name,
                  "contact": contact,
                  "age": age,
                  "appointments": appointments == null ? '0' : 'N/A',
                  "height": height == null ? 'N/A' : height,
                  "weight": weight == null ? 'N/A' : weight,
                  "gender": gender == null ? 'N/A' : gender,
                }));
        return "SignedUp";
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleAuth.signOut();
    await _auth.signOut();
  }
}
