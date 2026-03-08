// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future wyczyscStolik(DocumentReference stolikRef) async {
  // Pobiera całą podkolekcję zamówień tego stolika
  final pozycje = await stolikRef.collection('ordered_items').get();

  // Usuwa każdy dokument (danie) jeden po drugim
  for (var doc in pozycje.docs) {
    await doc.reference.delete();
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
