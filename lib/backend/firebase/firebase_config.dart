import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIuG-YYxCpMJ0uEejhcjtLhmm4Bn2p-9s",
            authDomain: "tiresias-9c18a.firebaseapp.com",
            projectId: "tiresias-9c18a",
            storageBucket: "tiresias-9c18a.appspot.com",
            messagingSenderId: "127728801279",
            appId: "1:127728801279:web:c5970254fe25343b1543ca"));
  } else {
    await Firebase.initializeApp();
  }
}
