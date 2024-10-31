import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDIu9MiC7pfReW6K0EG_UBFNHOtc-S7Fq0",
            authDomain: "sand-98353.firebaseapp.com",
            projectId: "sand-98353",
            storageBucket: "sand-98353.appspot.com",
            messagingSenderId: "30888011060",
            appId: "1:30888011060:web:8b62fe7927b676a9f4b161"));
  } else {
    await Firebase.initializeApp();
  }
}
