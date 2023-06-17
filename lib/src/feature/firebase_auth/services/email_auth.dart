import 'package:firebase_auth/firebase_auth.dart';

/// SOLID
/// CLEAN ARCHITECTURE -> 의존성 역전
/// 다형성

class FirebaseAuthProvider extends AuthProvider {
  final _auth = FirebaseAuth.instance;
  @override
  Future<void> logout() async {
    _auth.signOut();
  }

  @override
  Future<void> signIn(String email, String password) async {
    _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> verifyEmail() {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}

class GoogleAuthProvider extends AuthProvider {
  final _auth = GoogleAuth.insant;
  @override
  Future<void> logout() {
    _auth.logout();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> verifyEmail() {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}

/// App ->

class EmailAuth {
  /// 1, 의존성을 약하게 해라
  /// 2. 구글 auth , apple auth 다양한 auth 를 사용할 수 있도록

  // -> 어떤 메소드가 필요할 지 몰라서.
  // -> firebase auth 를 통으로 넘겨준다.
  final AuthProvider _auth;

  // -> 각 login 제공자 별로 interface 가 다르다.

  EmailAuth(this._auth);

  Future<EmailAuthState> signUp(String email, String password) async {
    try {
      await _auth.signIn(
        email,
        password,
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
    _auth.verifyEmail();
  }
}

abstract class AuthProvider {
  Future<void> signUp(String email, String password) async {}
  Future<void> signIn(String email, String password) async {}
  Future<void> logout() async {}
  Future<void> verifyEmail() async {}
}

abstract class EmailAuthState {}

class SignedUpAuthState extends EmailAuthState {}

class FailedAuthState extends EmailAuthState {
  final String errMsg;

  FailedAuthState(this.errMsg);
}
