// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> zmienHasloBezpiecznie(
  String stareHaslo,
  String noweHaslo,
) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      return 'Błąd: Użytkownik nie jest zalogowany.';
    }

    // 1. Sprawdzenie starego hasła (Reautentykacja w Firebase)
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!,
      password: stareHaslo,
    );
    await user.reauthenticateWithCredential(credential);

    // 2. Jeśli stare hasło jest poprawne -> zmieniamy na nowe
    await user.updatePassword(noweHaslo);

    return 'sukces'; // Magiczne słowo, jeśli wszystko poszło gładko
  } on FirebaseAuthException catch (e) {
    // Łapanie błędu złego hasła
    if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
      return 'Błędne aktualne hasło!';
    }
    return 'Wystąpił błąd: ${e.message}';
  } catch (e) {
    return 'Wystąpił nieznany błąd.';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
