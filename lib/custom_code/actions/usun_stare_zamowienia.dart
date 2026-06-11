// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future usunStareZamowienia() async {
  final firestore = FirebaseFirestore.instance;

  // 1. Wyznaczamy datę graniczną: dzisiaj minus 45 dni
  final granicaCzasu = DateTime.now().subtract(const Duration(days: 45));

  try {
    // 2. Szukamy zamówień starszych niż 45 dni (maksymalnie 500 naraz)
    final snapshot = await firestore
        .collection('order_history')
        .where('order_time', isLessThan: granicaCzasu)
        .limit(500)
        .get();

    // 3. Jeśli nie ma starych zamówień - przerywamy po cichu
    if (snapshot.docs.isEmpty) return;

    // 4. Jeśli są, pakujemy je wszystkie i kasujemy jednym poleceniem
    final batch = firestore.batch();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit(); // Wykonanie usunięcia z bazy
  } catch (e) {
    // Ciche ignorowanie błędów, by nie przerywać działania aplikacji
    print('Błąd czyszczenia starych zamówień: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
