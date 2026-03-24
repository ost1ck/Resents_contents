import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService({FirebaseAuth? firebaseAuth})
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<String?> signIn({
    required String email,
    required String password
}) async {
    try{

      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return null;
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        return 'User not found';
      }

      if(e.code == 'wrong-password'){
        return 'Wrong password';
      }

      return e.message ?? 'Authentication error';
    }catch (_){
      return "Something went wrong";
    }
  }

  Future<String?> signUp({
    required String email,
    required String password
})async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return null;
    }on FirebaseAuthException catch (error){
      if(error.code == 'email-already-in-use'){
        return 'Email already in use';
      }

      if(error.code == 'weak-password'){
        return 'Weak password';
      }

      return error.message ?? 'Registration error';
    }catch(_){
      return 'Something went wrong';
    }
  }
}