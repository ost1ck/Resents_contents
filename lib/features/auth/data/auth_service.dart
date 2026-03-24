import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth;

  AuthService({FirebaseAuth? firebaseAuth})
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signIn({
    required String email,
    required String password
}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);
  }

  Future<void> signUp({
    required String email,
    required String password
})async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }
}