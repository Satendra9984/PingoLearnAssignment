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
    apiKey: 'AIzaSyBW8fdealWNAR99VsNTzGJxGP5az2z7Gzw',
    appId: '1:518250795313:web:92c6b4e4473d094022a010',
    messagingSenderId: '518250795313',
    projectId: 'ast-nearby-hospital-finder',
    authDomain: 'ast-nearby-hospital-find-94cd4.firebaseapp.com',
    storageBucket: 'ast-nearby-hospital-finder.appspot.com',
    measurementId: 'G-DD0SNMMV6J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAb0lO8BseFmjjjujdfW6b5uTO0r0eVQE4',
    appId: '1:518250795313:android:8708f7ffb9837eef22a010',
    messagingSenderId: '518250795313',
    projectId: 'ast-nearby-hospital-finder',
    storageBucket: 'ast-nearby-hospital-finder.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgYSZEgK2m7N4vxd691RxyA1C7KEJDjNg',
    appId: '1:518250795313:ios:de9d3ec4e9230e3e22a010',
    messagingSenderId: '518250795313',
    projectId: 'ast-nearby-hospital-finder',
    storageBucket: 'ast-nearby-hospital-finder.appspot.com',
    androidClientId: '518250795313-13recs898qs2llejo7dr04kehimj46v7.apps.googleusercontent.com',
    iosClientId: '518250795313-jd3kmtc1vkmdun70jji62um47v7o89h3.apps.googleusercontent.com',
    iosBundleId: 'com.example.pingolearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgYSZEgK2m7N4vxd691RxyA1C7KEJDjNg',
    appId: '1:518250795313:ios:de9d3ec4e9230e3e22a010',
    messagingSenderId: '518250795313',
    projectId: 'ast-nearby-hospital-finder',
    storageBucket: 'ast-nearby-hospital-finder.appspot.com',
    androidClientId: '518250795313-13recs898qs2llejo7dr04kehimj46v7.apps.googleusercontent.com',
    iosClientId: '518250795313-jd3kmtc1vkmdun70jji62um47v7o89h3.apps.googleusercontent.com',
    iosBundleId: 'com.example.pingolearn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBW8fdealWNAR99VsNTzGJxGP5az2z7Gzw',
    appId: '1:518250795313:web:406da046457a752422a010',
    messagingSenderId: '518250795313',
    projectId: 'ast-nearby-hospital-finder',
    authDomain: 'ast-nearby-hospital-find-94cd4.firebaseapp.com',
    storageBucket: 'ast-nearby-hospital-finder.appspot.com',
    measurementId: 'G-GT1L305VXV',
  );
}
