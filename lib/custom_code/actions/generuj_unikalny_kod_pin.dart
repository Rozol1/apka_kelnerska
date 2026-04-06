// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future<String> generujUnikalnyKodPin() async {
  final firestore = FirebaseFirestore.instance;
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rnd = math.Random();
  String code = '';
  bool isUnique = false;

  while (!isUnique) {
    code = String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    // Sprawdzamy unikalność w Firestore
    final snapshot = await firestore
        .collection('restaurants')
        .where('kod_dolaczenia', isEqualTo: code)
        .get();

    if (snapshot.docs.isEmpty) {
      isUnique = true;
    }
  }

  return code;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
