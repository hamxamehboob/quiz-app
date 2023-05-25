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
    apiKey: 'AIzaSyAMjtGbMM2vKvAfabXKUPCJmwkDfjGFgqg',
    appId: '1:766505983935:web:0f70bc1f94ebd2c78b4b0a',
    messagingSenderId: '766505983935',
    projectId: 'quiz-app-f21ae',
    authDomain: 'quiz-app-f21ae.firebaseapp.com',
    storageBucket: 'quiz-app-f21ae.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApK5E4C4nZOiA-d5U6Pn8VsB5ja7GI6tY',
    appId: '1:766505983935:android:5151ca1ed16d2afe8b4b0a',
    messagingSenderId: '766505983935',
    projectId: 'quiz-app-f21ae',
    storageBucket: 'quiz-app-f21ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHG-wvyxFwTtcCz9Qcc2Uy9ZN6DY8LvDU',
    appId: '1:766505983935:ios:e21feb02a19620bb8b4b0a',
    messagingSenderId: '766505983935',
    projectId: 'quiz-app-f21ae',
    storageBucket: 'quiz-app-f21ae.appspot.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHG-wvyxFwTtcCz9Qcc2Uy9ZN6DY8LvDU',
    appId: '1:766505983935:ios:4b8dde24319303f48b4b0a',
    messagingSenderId: '766505983935',
    projectId: 'quiz-app-f21ae',
    storageBucket: 'quiz-app-f21ae.appspot.com',
    iosBundleId: 'com.example.quizApp.RunnerTests',
  );
}