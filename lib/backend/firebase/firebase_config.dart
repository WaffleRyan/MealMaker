import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBj-XFxMpTfz1g0e4BLRHV0cNfGsI_AqnU",
            authDomain: "meal-maker-x6hjel.firebaseapp.com",
            projectId: "meal-maker-x6hjel",
            storageBucket: "meal-maker-x6hjel.appspot.com",
            messagingSenderId: "53771046328",
            appId: "1:53771046328:web:33c78ef0112a0944d2d34d"));
  } else {
    await Firebase.initializeApp();
  }
}
