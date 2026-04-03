import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tempNazwaRestauracji =
          prefs.getString('ff_tempNazwaRestauracji') ?? _tempNazwaRestauracji;
    });
    _safeInit(() {
      _tempPinRestauracji =
          prefs.getString('ff_tempPinRestauracji') ?? _tempPinRestauracji;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _tempNazwaRestauracji = '';
  String get tempNazwaRestauracji => _tempNazwaRestauracji;
  set tempNazwaRestauracji(String value) {
    _tempNazwaRestauracji = value;
    prefs.setString('ff_tempNazwaRestauracji', value);
  }

  String _tempPinRestauracji = '';
  String get tempPinRestauracji => _tempPinRestauracji;
  set tempPinRestauracji(String value) {
    _tempPinRestauracji = value;
    prefs.setString('ff_tempPinRestauracji', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
