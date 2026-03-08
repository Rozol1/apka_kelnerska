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

String? wypiszAlergeny(
  bool? gluten,
  bool? jajka,
  bool? laktoza,
) {
  List<String> lista = [];

  if (gluten == true) lista.add('Gluten');
  if (jajka == true) lista.add('Jajka');
  if (laktoza == true) lista.add('Laktoza');
  // Jeśli masz inne, dopisz je tutaj analogicznie, np:
  // if (laktoza == true) lista.add('Laktoza');

  if (lista.isEmpty) {
    return 'Brak alergenów'; // lub return ''; jeśli ma być zupełnie puste
  }

  return lista.join(', ');
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
