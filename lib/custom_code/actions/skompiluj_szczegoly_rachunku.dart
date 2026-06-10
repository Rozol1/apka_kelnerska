// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> skompilujSzczegolyRachunku(
  List<OrderedItemsRecord>? listaDan,
) async {
  List<String> szczegoly = [];

  if (listaDan == null || listaDan.isEmpty) {
    return szczegoly;
  }

  for (var danie in listaDan) {
    // Pobieramy podstawowe dane z podkolekcji ordered_items
    int ilosc = danie.hasQuantity() ? danie.quantity : 1;
    String uwagi = danie.hasComment() ? danie.comment : '';
    String nazwaProduktu = 'Nieznany produkt';

    // Pobieramy nazwę z kolekcji products za pomocą referencji
    if (danie.hasProductRef() && danie.productRef != null) {
      var productDoc = await danie.productRef!.get();
      if (productDoc.exists) {
        var data = productDoc.data() as Map<String, dynamic>;
        // Zakładam, że pole nazwy w products to 'name' (zmień jeśli to np. 'nazwa')
        nazwaProduktu = data.containsKey('name') ? data['name'] : 'Produkt';
      }
    }

    // Kompilujemy jedną linijkę, np: "2x Burger (Uwagi: bez soli)"
    String linia = '${ilosc}x $nazwaProduktu';
    if (uwagi.trim().isNotEmpty) {
      linia += ' (Uwagi: ${uwagi.trim()})';
    }

    szczegoly.add(linia);
  }

  return szczegoly;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
