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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmEdcbnMxcfW5oJ87qsEOxe3S_KE6yn8Q',
    appId: '1:458144058212:web:075dd4e5ed90d76ce14871',
    messagingSenderId: '458144058212',
    projectId: 'solarscope-d7ca5',
    authDomain: 'solarscope-d7ca5.firebaseapp.com',
    storageBucket: 'solarscope-d7ca5.appspot.com',
    measurementId: 'G-9MRY1V982G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfej-zspfL_0UPEla1ywtNUQerwwiBTZw',
    appId: '1:458144058212:android:85b5a81e6afeb1b4e14871',
    messagingSenderId: '458144058212',
    projectId: 'solarscope-d7ca5',
    storageBucket: 'solarscope-d7ca5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkPrAj8jMSoLS5ig0PjW72bWixj3Gvv-o',
    appId: '1:458144058212:ios:190213796414fb96e14871',
    messagingSenderId: '458144058212',
    projectId: 'solarscope-d7ca5',
    storageBucket: 'solarscope-d7ca5.appspot.com',
    iosBundleId: 'com.example.solarscope',
  );
}
