import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD_ruRL4vMV3LNot2Bd4dB6Pzycwint9O8",
            authDomain: "orangevistaappdemo.firebaseapp.com",
            projectId: "orangevistaappdemo",
            storageBucket: "orangevistaappdemo.appspot.com",
            messagingSenderId: "1089764705575",
            appId: "1:1089764705575:web:19290bc97d88cad64b9502"));
  } else {
    await Firebase.initializeApp();
  }
}
