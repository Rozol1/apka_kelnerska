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

Future<List<String>> pobierzKategorieZbazy(
    DocumentReference? restauracjaRef) async {
  try {
    final firestore = FirebaseFirestore.instance;
    // Pobieramy całe menu
    final snapshot = await firestore
        .collection('products')
        .where('restaurant_ref', isEqualTo: restauracjaRef)
        .get();

    Set<String> unikalne = {};

    // Szukamy unikalnych kategorii
    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('category')) {
        var kategoria = doc.data()['category'];
        if (kategoria != null && kategoria.toString().trim().isNotEmpty) {
          unikalne.add(kategoria.toString().trim());
        }
      }
    }

    // Zamieniamy na listę i sortujemy alfabetycznie
    List<String> wynik = unikalne.toList();
    wynik.sort();

    // MAGIA: Wpychamy "Wszystkie" na sam początek listy (indeks 0)
    wynik.insert(0, 'Wszystkie');

    return wynik;
  } catch (e) {
    // W razie błędu awaryjnie pokazujemy chociaż "Wszystkie"
    return ['Wszystkie'];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
