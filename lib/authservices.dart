import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickpass/firestoreservices.dart';

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  static final firestoreservices=Firestoreservices();
 
static Future<String> signup({
    String? email,
    String? password,
    String? role,
    String? name, required String phone,
  }) async {
    String res = "something went wrong";
    try {
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      await _firestore.collection('users').doc(cred.user!.uid).set({
        'role': role,
        'uid': cred.user!.uid,
        "email": email,
        "name": name,
      });

      res = 'succes ';
    } catch (e) {
      res = e.toString();
    }
    return res;}

  static Future<String> login(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final role = await firestoreservices.getrole();
      res = role;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
