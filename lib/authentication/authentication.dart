import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth authenticateUser = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();
// Variable for logging into google

Future<User> signInWithGoogle() async {
  // Vars to collect User information
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication; 
  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  // To Authenticate the user against Firebase
  final UserCredential userCredential = await authenticateUser.signInWithCredential(credential);
  final User firebaseUser = userCredential.user;

  assert(!firebaseUser.isAnonymous);
  assert(await firebaseUser.getIdToken() != null);

  final User currentUser = authenticateUser.currentUser;
  assert(currentUser.uid == firebaseUser.uid);

  return firebaseUser;

}
