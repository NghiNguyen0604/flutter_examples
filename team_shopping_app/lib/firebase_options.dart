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
    apiKey: 'AIzaSyA2Q_OhYPDeRpFWPRe-qURjalWdv8XjrGk',
    appId: '1:756816975393:web:d97d9afbe9896dc2b8b560',
    messagingSenderId: '756816975393',
    projectId: 'flutter-samples-63251',
    authDomain: 'flutter-samples-63251.firebaseapp.com',
    storageBucket: 'flutter-samples-63251.appspot.com',
    measurementId: 'G-XQYX0GQWNT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDW1-q14imNxV82O91zIbKqFgDyQG5MVBA',
    appId: '1:756816975393:android:f3fca59d3ef9ce9ab8b560',
    messagingSenderId: '756816975393',
    projectId: 'flutter-samples-63251',
    storageBucket: 'flutter-samples-63251.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoyTS_qMHooyYABWVPGneFYrRNanj7TEs',
    appId: '1:756816975393:ios:65cf48e50138657fb8b560',
    messagingSenderId: '756816975393',
    projectId: 'flutter-samples-63251',
    storageBucket: 'flutter-samples-63251.appspot.com',
    androidClientId: '756816975393-omkkhernbos8bj4domlrl31b4765424a.apps.googleusercontent.com',
    iosClientId: '756816975393-e12rp1vf10u69u6iln0bhchnudlkh799.apps.googleusercontent.com',
    iosBundleId: 'com.example.teamShoppingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoyTS_qMHooyYABWVPGneFYrRNanj7TEs',
    appId: '1:756816975393:ios:65cf48e50138657fb8b560',
    messagingSenderId: '756816975393',
    projectId: 'flutter-samples-63251',
    storageBucket: 'flutter-samples-63251.appspot.com',
    androidClientId: '756816975393-omkkhernbos8bj4domlrl31b4765424a.apps.googleusercontent.com',
    iosClientId: '756816975393-e12rp1vf10u69u6iln0bhchnudlkh799.apps.googleusercontent.com',
    iosBundleId: 'com.example.teamShoppingApp',
  );
}
