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

Future<List<String>> pobierzAlergenyZbazy() async {
  try {
    final firestore = FirebaseFirestore.instance;
    // Skrypt sam pobiera CAŁĄ kolekcję products
    final snapshot = await firestore.collection('products').get();

    Set<String> unikalne = {};

    // Lecimy po każdym daniu
    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('allergens')) {
        var allergensData = doc.data()['allergens'];

        // Kod inteligentnie poradzi sobie, niezależnie czy w bazie
        // alergeny są zapisane jako Lista, czy jako tekst po przecinku
        if (allergensData is Iterable) {
          for (var wpis in allergensData) {
            var podzielone = wpis
                .toString()
                .split(',')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty);
            unikalne.addAll(podzielone);
          }
        } else if (allergensData is String) {
          var podzielone = allergensData
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty);
          unikalne.addAll(podzielone);
        }
      }
    }

    // Sortujemy i oddajemy gotową listę
    List<String> wynik = unikalne.toList();
    wynik.sort();
    return wynik;
  } catch (e) {
    // W razie błędu połączenia nie wywalamy apki, tylko puste opcje
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
