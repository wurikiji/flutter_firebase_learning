import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_study/src/core/utils/platform_check.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth.g.dart';

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  Future<void> emulatorSetting() {
    if(PlatformCheck.isEmulator()) {
            return _auth.useAuthEmulator('localhost', 9099);

    }
    return Future.value();
  }



  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider));
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}


@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  if(PlatformCheck.isEmulator()) {
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  return FirebaseAuth.instance;
}

