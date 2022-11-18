import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> loginWithEmailAndPassword({required String email, required String password});

  Future<User?> registerWithEmailAndPassword({required String email, required String password});

  Future<void> logOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword({required String email, required String password}) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> registerWithEmailAndPassword({required String email, required String password}) async {
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> logOut() async => _firebaseAuth.signOut();
}
