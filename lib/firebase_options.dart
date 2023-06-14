// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjfUeyfhpHKPG7gb1JIWROdJ6jY9J8Mn0',
    appId: '1:364393401324:android:d307c11804fc0ff1498ec9',
    messagingSenderId: '364393401324',
    projectId: 'flutter-firebase-learnin-febfb',
    storageBucket: 'flutter-firebase-learnin-febfb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDn8e4qRLpgv0u6cxhwsTHcV8IOAOmMzc4',
    appId: '1:364393401324:ios:1a3839360399bdc5498ec9',
    messagingSenderId: '364393401324',
    projectId: 'flutter-firebase-learnin-febfb',
    storageBucket: 'flutter-firebase-learnin-febfb.appspot.com',
    iosClientId: '364393401324-5gidc3qp5v3u1j05kmn7dsksoi6vgnb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseStudy',
  );
}
