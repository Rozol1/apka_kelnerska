// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future odswiezStatusStolika(DocumentReference stolikRef) async {
  // 1. Dajemy bazie ułamek sekundy na zapisanie nowych kliknięć
  await Future.delayed(Duration(milliseconds: 200));

  // 2. Pobieramy dokument stolika z bazy
  final stolikDoc = await stolikRef.get();
  if (!stolikDoc.exists) return;

  final data = stolikDoc.data() as Map<String, dynamic>? ?? {};

  // 3. POPRAWKA: Pobieramy pole 'guests_count' zgodnie z Twoją bazą danych
  int liczbaOsob = 0;
  if (data['guests_count'] != null) {
    liczbaOsob = (data['guests_count'] as num).toInt();
  }

  final String aktualnyStatus = data['status'] as String? ?? '';

  // 4. Pobieramy wszystkie aktualne zamówienia dla tego stolika
  final zamowienia = await stolikRef.collection('ordered_items').get();

  String nowyStatus = 'Wolny';

  // 5. LOGIKA
  if (zamowienia.docs.isEmpty) {
    if (liczbaOsob > 0) {
      nowyStatus = 'Oczekuje na kelnera';
    } else {
      nowyStatus = 'Wolny';
    }
  } else {
    bool wszystkoWydane = true;
    for (var doc in zamowienia.docs) {
      final docData = doc.data() as Map<String, dynamic>? ?? {};
      // Sprawdzanie czy danie jest wydane
      if (docData['czy_dostarczone'] != true) {
        wszystkoWydane = false;
        break;
      }
    }
    nowyStatus = wszystkoWydane ? 'Do posprzątania' : 'Zajęty';
  }

  // 6. Zapisujemy w bazie
  if (aktualnyStatus != nowyStatus) {
    await stolikRef.update({
      'status': nowyStatus,
      'czas_zmiany_statusu': DateTime.now(),
    });
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
