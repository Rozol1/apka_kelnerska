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

Future zmienLiczbeStolikow(int nowaLiczba) async {
  final tablesCollection = FirebaseFirestore.instance.collection('tables');
  final snapshot = await tablesCollection.get();

  // Sortujemy stoliki po ID, żeby wiedzieć które są ostatnie
  final currentDocs = snapshot.docs.toList()
    ..sort((a, b) =>
        (a.data()['table_id'] as int).compareTo(b.data()['table_id'] as int));

  final aktualnaLiczba = currentDocs.length;

  if (nowaLiczba > aktualnaLiczba) {
    // DODAWANIE: Tworzymy nowe dokumenty od ostatniego ID
    for (var i = aktualnaLiczba + 1; i <= nowaLiczba; i++) {
      await tablesCollection.add({
        'table_id': i,
        'status': 'Wolny',
        'guests_count': 0,
      });
    }
  } else if (nowaLiczba < aktualnaLiczba) {
    // USUWANIE: Kasujemy nadmiarowe stoliki od końca
    final ileUsunac = aktualnaLiczba - nowaLiczba;
    final docsToDelete = currentDocs.sublist(nowaLiczba);

    for (var doc in docsToDelete) {
      // 1. Czyścimy subkolekcję zamówień (ordered_items)
      final subcollection = doc.reference.collection('ordered_items');
      final subItems = await subcollection.get();
      for (var subDoc in subItems.docs) {
        await subDoc.reference.delete();
      }
      // 2. Usuwamy sam dokument stolika
      await doc.reference.delete();
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
