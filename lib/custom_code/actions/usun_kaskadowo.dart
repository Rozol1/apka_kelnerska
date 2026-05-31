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

Future usunKaskadowo(String restaurantId) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch(); // Inicjujemy bezpieczną paczkę operacji

  try {
    // 1. Usuwamy WSZYSTKICH kelnerów przypisanych do tej restauracji z bazy
    var users = await firestore
        .collection('users')
        .where('restaurant_id', isEqualTo: restaurantId)
        .get();
    for (var doc in users.docs) {
      // Uzbrajamy samozniszczenie konta kelnera
      batch.update(doc.reference, {
        'oczekuje_na_usuniecie': true,
        'data_usuniecia': DateTime.now().subtract(Duration(days: 1)),
      });
    }

    // 2. Usuwamy wszystkie stoliki
    var tables = await firestore
        .collection('tables')
        .where('restaurant_id', isEqualTo: restaurantId)
        .get();
    for (var doc in tables.docs) {
      batch.delete(doc.reference);
    }

    // 3. Usuwamy całe menu (produkty)
    var products = await firestore
        .collection('products')
        .where('restaurant_id', isEqualTo: restaurantId)
        .get();
    for (var doc in products.docs) {
      batch.delete(doc.reference);
    }

    // 4. Usuwamy wszystkie zamówienia (historię i bieżące)
    var orders = await firestore
        .collection('ordered_items')
        .where('restaurant_id', isEqualTo: restaurantId)
        .get();
    for (var doc in orders.docs) {
      batch.delete(doc.reference);
    }

    // 5. Na samym końcu usuwamy obiekt głównej restauracji
    var restRef = firestore.collection('restaurants').doc(restaurantId);
    batch.delete(restRef);

    // Wysyłamy całe uderzenie do bazy w jednym ułamku sekundy
    await batch.commit();
  } catch (e) {
    print('Krytyczny błąd usuwania kaskadowego: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
