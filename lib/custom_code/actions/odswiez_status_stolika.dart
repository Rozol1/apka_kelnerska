// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart'; // Dodany import dla GetOptions

Future odswiezStatusStolika(DocumentReference stolikRef) async {
  // 1. Zostawiamy małe opóźnienie dla pewności
  await Future.delayed(Duration(milliseconds: 600));

  // 2. WYMUSZAMY ODCZYT Z SERWERA (Ignorujemy stary cache telefonu!)
  final stolikDoc =
      await stolikRef.get(const GetOptions(source: Source.server));
  if (!stolikDoc.exists) return;

  final data = stolikDoc.data() as Map<String, dynamic>? ?? {};

  int liczbaOsob = 0;
  if (data['guests_count'] != null) {
    liczbaOsob = (data['guests_count'] as num).toInt();
  }

  final String aktualnyStatus = data['status'] as String? ?? '';

  // 3. POBIERAMY DANIA RÓWNIEŻ Z SERWERA
  final zamowieniaSnapshot = await stolikRef
      .collection('ordered_items')
      .get(const GetOptions(source: Source.server));
  final zamowienia = zamowieniaSnapshot.docs;

  String nowyStatus = 'Wolny';

  // 4. LOGIKA STATUSÓW
  if (zamowienia.isEmpty) {
    if (liczbaOsob > 0) {
      nowyStatus = 'Oczekuje na kelnera';
    } else {
      nowyStatus = 'Wolny';
    }
  } else {
    bool wszystkoWydane = true;
    for (var doc in zamowienia) {
      final docData = doc.data();
      bool czyDostarczone = false;
      if (docData.containsKey('czy_dostarczone')) {
        czyDostarczone = docData['czy_dostarczone'] == true;
      }

      if (!czyDostarczone) {
        wszystkoWydane = false;
        break;
      }
    }
    nowyStatus = wszystkoWydane ? 'Do posprzątania' : 'Zajęty';
  }

  // 5. ZAPIS W BAZIE
  if (aktualnyStatus != nowyStatus) {
    await stolikRef.update({
      'status': nowyStatus,
      'czas_zmiany_statusu': FieldValue.serverTimestamp(),
    });
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
