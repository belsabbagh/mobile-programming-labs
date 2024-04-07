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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyACbpe3aorjIxcyS3O6Nix4bc_ICZoS4aE',
    appId: '1:627500894281:web:8d8540b8633c17a1291798',
    messagingSenderId: '627500894281',
    projectId: 'simple-users-3f31a',
    authDomain: 'simple-users-3f31a.firebaseapp.com',
    storageBucket: 'simple-users-3f31a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3o7ACKwjERiVNXEpSFdR-3keEyCDoVmw',
    appId: '1:627500894281:android:f9ff56622a752e23291798',
    messagingSenderId: '627500894281',
    projectId: 'simple-users-3f31a',
    storageBucket: 'simple-users-3f31a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfBw7iVAuk_bTTdtRfNeTwq4sHop2SN5Q',
    appId: '1:627500894281:ios:c2b53aa1c9e3423d291798',
    messagingSenderId: '627500894281',
    projectId: 'simple-users-3f31a',
    storageBucket: 'simple-users-3f31a.appspot.com',
    iosBundleId: 'com.example.mobileLabs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfBw7iVAuk_bTTdtRfNeTwq4sHop2SN5Q',
    appId: '1:627500894281:ios:dc513f55d61394d1291798',
    messagingSenderId: '627500894281',
    projectId: 'simple-users-3f31a',
    storageBucket: 'simple-users-3f31a.appspot.com',
    iosBundleId: 'com.example.mobileLabs.RunnerTests',
  );
}
