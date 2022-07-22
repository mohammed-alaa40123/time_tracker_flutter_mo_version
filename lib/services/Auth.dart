// ignore_for_file: body_might_complete_normally_nullable, file_names, unnecessary_null_comparison, import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Authbase {
  User? get currentUser;
  Future<User?> signInAnonymously();
  Future<User?> signInWithGoogle();
  Stream<User?> authStateChange();
  Future<User?> signOut();
}

class Auth implements Authbase {
  @override
  Stream<User?> authStateChange() => f.authStateChanges();

  final f = FirebaseAuth.instance;

  @override
  User? get currentUser => f.currentUser;

  @override
  Future<User?> signInAnonymously() async {
    final userCredentials = await f.signInAnonymously();
    return userCredentials.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await f.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_TOKEN',
            message: 'Missing Google Id Token');
      }
    } else {
      throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  @override
  Future<User?> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await f.signOut();
  }
}
