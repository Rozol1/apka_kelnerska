import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? obliczKwote(
  double? cena,
  int? ilosc,
) {
  return cena! * ilosc!;
}

String? wypiszAlergeny(List<String>? alergenyDania) {
  if (alergenyDania == null || alergenyDania.isEmpty) {
    return 'Brak alergenów';
  }
  return alergenyDania.join(', ');
}

int zwiekszIlosc(int obecnaIlosc) {
  return obecnaIlosc + 1;
}

int zmniejszIlosc(int obecnaIlosc) {
  if (obecnaIlosc > 1) {
    return obecnaIlosc - 1;
  } else {
    return 1;
  }
}

double obliczSumeRachunku(List<OrderedItemsRecord> lista) {
  double suma = 0.0;

  for (var pozycja in lista) {
    suma += pozycja.itemTotalPrice ?? 0.0;
  }

  return suma;
}

bool czyPokazacDanie(
  List<String>? wybraneAlergeny,
  String nazwaDania,
  String? szukanaFraza,
  List<String>? alergenyDania,
) {
  if (szukanaFraza != null && szukanaFraza.trim().isNotEmpty) {
    if (!nazwaDania.toLowerCase().contains(szukanaFraza.toLowerCase())) {
      return false;
    }
  }

  if (wybraneAlergeny != null && wybraneAlergeny.isNotEmpty) {
    if (alergenyDania != null && alergenyDania.isNotEmpty) {
      for (var alergen in wybraneAlergeny) {
        if (alergenyDania.contains(alergen)) return false;
      }
    }
  }
  return true;
}

List<String> pobierzUnikalneKategorie(List<ProductsRecord>? produkty) {
  if (produkty == null || produkty.isEmpty) {
    return ['Inna kategoria...'];
  }

  List<String> unikalne = [];

  for (var item in produkty) {
    if (item.hasCategory() && item.category.isNotEmpty) {
      if (!unikalne.contains(item.category)) {
        unikalne.add(item.category);
      }
    }
  }

  // ZAWSZE dodajemy tę opcję na sam koniec listy
  unikalne.add('Inna kategoria...');

  return unikalne;
}

List<String> polaczAlergeny(
  List<String>? zChipsow,
  String? wpisanyTekst,
) {
  Set<String> unikalne = {};

  // Dodajemy te przeklikane z ChoiceChips
  if (zChipsow != null && zChipsow.isNotEmpty) {
    unikalne.addAll(zChipsow);
  }

  // Rozcinamy po przecinkach i dodajemy nowe z pola tekstowego
  if (wpisanyTekst != null && wpisanyTekst.trim().isNotEmpty) {
    var podzielone =
        wpisanyTekst.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
    unikalne.addAll(podzielone);
  }

  List<String> wynik = unikalne.toList();
  wynik.sort();
  return wynik;
}

List<ProductsRecord> wyszukajDania(
  List<ProductsRecord>? bazaDan,
  String? szukanaFraza,
) {
// Jeśli baza jest pusta, zwróć pustą listę
  if (bazaDan == null || bazaDan.isEmpty) {
    return [];
  }

  // Jeśli nikt nic nie wpisał w wyszukiwarkę, pokaż wszystkie dania
  if (szukanaFraza == null || szukanaFraza.trim().isEmpty) {
    return bazaDan;
  }

  // Zamieniamy wpisaną frazę na małe litery, żeby ignorować wielkość znaków
  final fraza = szukanaFraza.toLowerCase().trim();

  // Filtrujemy listę sprawdzając, czy nazwa dania zawiera wpisaną frazę
  return bazaDan.where((danie) {
    final nazwaDania = danie.name?.toLowerCase() ?? '';
    return nazwaDania.contains(fraza);
  }).toList();
}
