import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static const String TAG = "LoginGoogle";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // Google Methods
  // signInWithGoogle
  Future<User?> signInWithGoogle() async {
    log(TAG + ", Sign in method");

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    log(TAG +
        ", signInWithGoogle() googleUser email -> ${googleSignInAccount?.email}");

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    try {
      var userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      return _isCurrentSignIn(user!);
    } on PlatformException catch (e) {
    } catch (err) {}
  }

  Future<User?> _isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = auth.currentUser;
      assert(user.uid == currentUser?.uid);

      log(TAG + ", signInWithgoogle successful: $user");

      return user;
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    log(TAG + ", User signed out, Google");
  }
}
