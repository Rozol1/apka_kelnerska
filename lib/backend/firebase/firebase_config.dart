import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjbVIN4s5ySt-PL8s9M2j_LWU7eo1f6CM",
            authDomain: "apkakelnerska-cpnck0.firebaseapp.com",
            projectId: "apkakelnerska-cpnck0",
            storageBucket: "apkakelnerska-cpnck0.firebasestorage.app",
            messagingSenderId: "998524524407",
            appId: "1:998524524407:web:8a78e9fecc1bc9fd197372"));
  } else {
    await Firebase.initializeApp();
  }
}
