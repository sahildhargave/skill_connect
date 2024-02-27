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
    apiKey: 'AIzaSyCnobaLgdfI-qPBTSj0Pz_T8QVkz_UPUIE',
    appId: '1:400970333716:web:498d3d3398b0847c117101',
    messagingSenderId: '400970333716',
    projectId: 'reddit-370a5',
    authDomain: 'reddit-370a5.firebaseapp.com',
    storageBucket: 'reddit-370a5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8oB8qdcX0Wb8JQKxddSN4P5Y1P0iZeB4',
    appId: '1:400970333716:android:afded6d5daaee08e117101',
    messagingSenderId: '400970333716',
    projectId: 'reddit-370a5',
    storageBucket: 'reddit-370a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApmGAk65Bn-E8RMvTf0GxBXLg9Z3BMKyc',
    appId: '1:400970333716:ios:8f08e40bc0595797117101',
    messagingSenderId: '400970333716',
    projectId: 'reddit-370a5',
    storageBucket: 'reddit-370a5.appspot.com',
    iosClientId: '400970333716-uafo15ndjsvnvhhgfhkrfb029ncec928.apps.googleusercontent.com',
    iosBundleId: 'com.example.reddit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApmGAk65Bn-E8RMvTf0GxBXLg9Z3BMKyc',
    appId: '1:400970333716:ios:8f08e40bc0595797117101',
    messagingSenderId: '400970333716',
    projectId: 'reddit-370a5',
    storageBucket: 'reddit-370a5.appspot.com',
    iosClientId: '400970333716-uafo15ndjsvnvhhgfhkrfb029ncec928.apps.googleusercontent.com',
    iosBundleId: 'com.example.reddit',
  );
}
