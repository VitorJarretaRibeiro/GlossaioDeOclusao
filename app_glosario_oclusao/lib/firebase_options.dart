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
    apiKey: 'AIzaSyCxkkGDJOoYXCYPcqaPCm_GJLnRIJDWTUg',
    appId: '1:513066913406:web:70123914ec0df8933e522f',
    messagingSenderId: '513066913406',
    projectId: 'glossariodeoclusao',
    authDomain: 'glossariodeoclusao.firebaseapp.com',
    storageBucket: 'glossariodeoclusao.appspot.com',
    measurementId: 'G-D87CNZ2GMZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsulOd6rfknCUHycqYrJa3PG4ToSZ3NlU',
    appId: '1:513066913406:android:a0d0df53626ab7903e522f',
    messagingSenderId: '513066913406',
    projectId: 'glossariodeoclusao',
    storageBucket: 'glossariodeoclusao.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYLo8i4ASSluWlysUtn533nv-06r7X6Ak',
    appId: '1:513066913406:ios:bb8d0a692bc07d9e3e522f',
    messagingSenderId: '513066913406',
    projectId: 'glossariodeoclusao',
    storageBucket: 'glossariodeoclusao.appspot.com',
    iosClientId: '513066913406-hkicdd8e3eb51onco4u0e7r6vko2luba.apps.googleusercontent.com',
    iosBundleId: 'com.example.appGlosarioOclusao',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYLo8i4ASSluWlysUtn533nv-06r7X6Ak',
    appId: '1:513066913406:ios:bb8d0a692bc07d9e3e522f',
    messagingSenderId: '513066913406',
    projectId: 'glossariodeoclusao',
    storageBucket: 'glossariodeoclusao.appspot.com',
    iosClientId: '513066913406-hkicdd8e3eb51onco4u0e7r6vko2luba.apps.googleusercontent.com',
    iosBundleId: 'com.example.appGlosarioOclusao',
  );
}