import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _wybranaKategoria = '';
  String get wybranaKategoria => _wybranaKategoria;
  set wybranaKategoria(String value) {
    _wybranaKategoria = value;
  }

  List<String> _wybraneAlergeny = [];
  List<String> get wybraneAlergeny => _wybraneAlergeny;
  set wybraneAlergeny(List<String> value) {
    _wybraneAlergeny = value;
  }

  void addToWybraneAlergeny(String value) {
    wybraneAlergeny.add(value);
  }

  void removeFromWybraneAlergeny(String value) {
    wybraneAlergeny.remove(value);
  }

  void removeAtIndexFromWybraneAlergeny(int index) {
    wybraneAlergeny.removeAt(index);
  }

  void updateWybraneAlergenyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    wybraneAlergeny[index] = updateFn(_wybraneAlergeny[index]);
  }

  void insertAtIndexInWybraneAlergeny(int index, String value) {
    wybraneAlergeny.insert(index, value);
  }
}
