import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class EmailAuth {
  final FirebaseAuth _auth;

  EmailAuth(this._auth);

  Future<EmailAuthState> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SignedUpAuthState();
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email.";
      } else {
        message = e.message ?? "An unknown error occurred.";
      }
      return FailedAuthState(message);
    } catch (e) {
      return FailedAuthState("An unknown error occurred.");
    }
  }

  Future<void> sendEmailVerification() async {
    debugPrint(_auth.currentUser.toString());
    await _auth.currentUser?.sendEmailVerification();
  }
}

abstract class EmailAuthState {}

class SignedUpAuthState extends EmailAuthState {}

class FailedAuthState extends EmailAuthState {
  final String errMsg;

  FailedAuthState(this.errMsg);
}
