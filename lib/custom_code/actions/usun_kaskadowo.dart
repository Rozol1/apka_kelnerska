// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports
import 'package:cloud_firestore/cloud_firestore.dart';

Future usunKaskadowo(DocumentReference? restaurantRef) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  // 1. Znajdź wszystkich kelnerów przypisanych do tej restauracji
  final usersSnapshot = await firestore
      .collection('users')
      .where('restaurant_ref', isEqualTo: restaurantRef)
      .get();

  // ZMIANA: Zamiast usuwać, "odpinamy" kelnera od restauracji (ustawiamy null)
  for (var doc in usersSnapshot.docs) {
    batch.update(doc.reference, {'restaurant_ref': null});
  }

  // 2. Usuń stoliki
  final tablesSnapshot = await firestore
      .collection('tables')
      .where('restaurant_ref', isEqualTo: restaurantRef)
      .get();
  for (var doc in tablesSnapshot.docs) {
    batch.delete(doc.reference);
  }

  // 3. Usuń produkty
  final productsSnapshot = await firestore
      .collection('products')
      .where('restaurant_ref', isEqualTo: restaurantRef)
      .get();
  for (var doc in productsSnapshot.docs) {
    batch.delete(doc.reference);
  }

  // 4. Usuń historię zamówień
  final historySnapshot = await firestore
      .collection('order_history')
      .where('restaurant_ref', isEqualTo: restaurantRef)
      .get();
  for (var doc in historySnapshot.docs) {
    batch.delete(doc.reference);
  }

  // 5. Na koniec usuń sam dokument restauracji
  batch.delete(restaurantRef!);

  // Zatwierdź wszystkie operacje naraz
  await batch.commit();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
