import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // REGISTRAZIONE
  Future<User?> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("Errore registrazione: ${e.code} - ${e.message}");
      return null;
    }
  }

  // LOGIN
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("Errore login: ${e.code} - ${e.message}");
      return null;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // SIGN IN WITH CREDENTIAL (es. Facebook)
  Future<User?> signInWithCredential(AuthCredential credential) async {
    try {
      final result = await _auth.signInWithCredential(credential);
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("Errore signInWithCredential: ${e.code} - ${e.message}");
      return null;
    }
  }
}