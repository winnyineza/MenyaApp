// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBR2qfZhg7YHCGIhwBmUphEwk0mHMxtn28',
    appId: '1:631538243044:web:7ead02ef3bbe900225a3f1',
    messagingSenderId: '631538243044',
    projectId: 'menyaapp-1fb1e',
    authDomain: 'menyaapp-1fb1e.firebaseapp.com',
    databaseURL: 'https://menyaapp-1fb1e-default-rtdb.firebaseio.com',
    storageBucket: 'menyaapp-1fb1e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4-7gr7C9fLYFoH0zPpLlepc_wgArQ19I',
    appId: '1:631538243044:android:f3285ae965b96c7b25a3f1',
    messagingSenderId: '631538243044',
    projectId: 'menyaapp-1fb1e',
    databaseURL: 'https://menyaapp-1fb1e-default-rtdb.firebaseio.com',
    storageBucket: 'menyaapp-1fb1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQdTEK1UUzZ3mgp2Fa-DQ02dVthbUYxOg',
    appId: '1:631538243044:ios:f6087f32cc0ae18a25a3f1',
    messagingSenderId: '631538243044',
    projectId: 'menyaapp-1fb1e',
    databaseURL: 'https://menyaapp-1fb1e-default-rtdb.firebaseio.com',
    storageBucket: 'menyaapp-1fb1e.appspot.com',
    iosClientId: '631538243044-j3g57kbgamshb13rl45unkh4bad98lel.apps.googleusercontent.com',
    iosBundleId: 'com.example.menyaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQdTEK1UUzZ3mgp2Fa-DQ02dVthbUYxOg',
    appId: '1:631538243044:ios:f6087f32cc0ae18a25a3f1',
    messagingSenderId: '631538243044',
    projectId: 'menyaapp-1fb1e',
    databaseURL: 'https://menyaapp-1fb1e-default-rtdb.firebaseio.com',
    storageBucket: 'menyaapp-1fb1e.appspot.com',
    iosClientId: '631538243044-j3g57kbgamshb13rl45unkh4bad98lel.apps.googleusercontent.com',
    iosBundleId: 'com.example.menyaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBR2qfZhg7YHCGIhwBmUphEwk0mHMxtn28',
    appId: '1:631538243044:web:3abaf843c71499e825a3f1',
    messagingSenderId: '631538243044',
    projectId: 'menyaapp-1fb1e',
    authDomain: 'menyaapp-1fb1e.firebaseapp.com',
    databaseURL: 'https://menyaapp-1fb1e-default-rtdb.firebaseio.com',
    storageBucket: 'menyaapp-1fb1e.appspot.com',
  );

}