import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCleoOYPJVD1RzbZ2iAHlKnNF8rNvyR_Vw",
            authDomain: "x-hackaton.firebaseapp.com",
            projectId: "x-hackaton",
            storageBucket: "x-hackaton.appspot.com",
            messagingSenderId: "1073995813617",
            appId: "1:1073995813617:web:6971975c8972b1c2db0f50"));
  } else {
    await Firebase.initializeApp();
  }
}
