import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCo-4RIChEPtoptAcWAEoucJCbg9Y1guGo',
    appId: '1:321961203283:android:8bc626811c4984465fd8a6',
    messagingSenderId: '321961203283',
    projectId: 'bharat-social-87cfd',
    storageBucket: 'bharat-social-87cfd.firebasestorage.app',
  );

  static FirebaseOptions get currentPlatform => android;
}
