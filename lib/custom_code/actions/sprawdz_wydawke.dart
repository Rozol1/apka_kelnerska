// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future sprawdzWydawke(
    DocumentReference stolikRef, DocumentReference? restauracjaRef) async {
  // Pobieramy wszystkie dania przypisane do tego stolika
  final zamowienia = await stolikRef
      .collection('ordered_items')
      .where('restaurant_ref', isEqualTo: restauracjaRef)
      .get();

  if (zamowienia.docs.isEmpty)
    return; // Jeśli stolik jest pusty, nic nie robimy

  bool wszystkoWydane = true;

  for (var doc in zamowienia.docs) {
    // Sprawdzamy czy którekolwiek danie NIE jest dostarczone
    if (doc.data()['czy_dostarczone'] != true) {
      wszystkoWydane = false;
      break;
    }
  }

  // Jeśli pętla nie znalazła niedostarczonych dań, zmieniamy status
  if (wszystkoWydane) {
    await stolikRef.update({'status': 'Do posprzątania'});
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
