import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuthState {
  final bool isErr;
  final String? errorMessage;

  EmailAuthState({required this.isErr, this.errorMessage});
}

class EmailAuth {
  final FirebaseAuth _auth;

  EmailAuth(this._auth);

  Future<EmailAuthState> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return EmailAuthState(isErr: false);
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email.";
      } else {
        message = e.message ?? "An unknown error occurred.";
      }
      return EmailAuthState(isErr: true, errorMessage: message);
    } catch (e) {
      return EmailAuthState(
          isErr: true, errorMessage: "An unknown error occurred.");
    }
  }

  Future<void> sendEmailVerification() async {
    debugPrint(_auth.currentUser.toString());
    await _auth.currentUser?.sendEmailVerification();
  }
}
