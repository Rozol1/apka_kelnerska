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
  String? wybranaKategoria,
  List<String>? wybraneAlergeny,
) {
// Jeśli baza jest pusta, zwróć pustą listę
  if (bazaDan == null || bazaDan.isEmpty) {
    return [];
  }

  // Zaczynamy od pełnej bazy dań
  Iterable<ProductsRecord> wynik = bazaDan;

  // 1. FILTR KATEGORII
  if (wybranaKategoria != null && wybranaKategoria.trim().isNotEmpty) {
    wynik = wynik.where((danie) => danie.category == wybranaKategoria);
  }

  // 2. FILTR TEKSTOWY (WYSZUKIWARKA)
  if (szukanaFraza != null && szukanaFraza.trim().isNotEmpty) {
    final fraza = szukanaFraza.toLowerCase().trim();
    wynik = wynik.where((danie) {
      final nazwaDania = danie.name?.toLowerCase() ?? '';
      return nazwaDania.contains(fraza);
    });
  }

  // 3. FILTR ALERGENÓW (WYKLUCZANIE)
  if (wybraneAlergeny != null && wybraneAlergeny.isNotEmpty) {
    wynik = wynik.where((danie) {
      final alergenyDania = danie.allergens ?? [];

      // Sprawdzamy, czy danie ma w sobie którykolwiek z wykluczonych alergenów
      for (var alergen in wybraneAlergeny) {
        if (alergenyDania.contains(alergen)) {
          return false; // Znaleziono zakazany alergen - odrzucamy danie z listy!
        }
      }
      return true; // Danie jest czyste, zostaje na liście
    });
  }

  // Zwracamy gotową, odfiltrowaną listę
  return wynik.toList();
}

double formatujCene(String? wpisanaCena) {
  if (wpisanaCena == null || wpisanaCena.trim().isEmpty) {
    return 0.0;
  }

  // Magia: zamieniamy przecinek na kropkę
  String poprawiona = wpisanaCena.replaceAll(',', '.');

  // Zamieniamy tekst na liczbę (jeśli się nie uda, dajemy 0.0)
  return double.tryParse(poprawiona) ?? 0.0;
}

String obliczCzasStolika(
  DateTime? czasZmiany,
  DateTime? aktualnyCzas,
) {
// Jeśli brakuje danych, pokazujemy zera
  if (czasZmiany == null || aktualnyCzas == null) return "00:00";

  // Obliczamy różnicę w sekundach
  final int uplynelo = aktualnyCzas.difference(czasZmiany).inSeconds;

  if (uplynelo <= 0) return "00:00"; // Zabezpieczenie przed ujemnym czasem

  // Konwersja na minuty i sekundy
  final int minuty = uplynelo ~/ 60;
  final int sekundy = uplynelo % 60;

  // Dodajemy zera z przodu (żeby było 05 zamiast 5)
  final String minutyStr = minuty.toString().padLeft(2, '0');
  final String sekundyStr = sekundy.toString().padLeft(2, '0');

  // Zwracamy gotowy tekst dla kelnera
  return "$minutyStr:$sekundyStr";
}

String generujKodPin() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rnd = math.Random();
  // Generuje losowy 6-znakowy kod
  return String.fromCharCodes(
      Iterable.generate(6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

String przypiszRole(String? wyborChoiceChip) {
// Jeśli użytkownik wybrał opcję zakładania restauracji
  if (wyborChoiceChip == 'Zakładam nową restaurację') {
    return 'wlasciciel';
  }
  // W każdym innym wypadku (czyli dołącza jako kelner)
  else {
    return 'kelner';
  }
}
