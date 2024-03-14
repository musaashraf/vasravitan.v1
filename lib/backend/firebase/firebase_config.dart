import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBUNDbS4byidxwEh42yVsY7fqu9FBEVEbU",
            authDomain: "vasravitan-t5w3r9.firebaseapp.com",
            projectId: "vasravitan-t5w3r9",
            storageBucket: "vasravitan-t5w3r9.appspot.com",
            messagingSenderId: "674882402559",
            appId: "1:674882402559:web:21343f0d494a34e2dbb4ca"));
  } else {
    await Firebase.initializeApp();
  }
}
