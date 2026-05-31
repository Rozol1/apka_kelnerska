import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  // "kod_dolaczenia" field.
  String? _kodDolaczenia;
  String get kodDolaczenia => _kodDolaczenia ?? '';
  bool hasKodDolaczenia() => _kodDolaczenia != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "trwa_likwidacja_lokalu" field.
  bool? _trwaLikwidacjaLokalu;
  bool get trwaLikwidacjaLokalu => _trwaLikwidacjaLokalu ?? false;
  bool hasTrwaLikwidacjaLokalu() => _trwaLikwidacjaLokalu != null;

  // "data_likwidacji_lokalu" field.
  DateTime? _dataLikwidacjiLokalu;
  DateTime? get dataLikwidacjiLokalu => _dataLikwidacjiLokalu;
  bool hasDataLikwidacjiLokalu() => _dataLikwidacjiLokalu != null;

  void _initializeFields() {
    _nazwa = snapshotData['nazwa'] as String?;
    _kodDolaczenia = snapshotData['kod_dolaczenia'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _trwaLikwidacjaLokalu = snapshotData['trwa_likwidacja_lokalu'] as bool?;
    _dataLikwidacjiLokalu = snapshotData['data_likwidacji_lokalu'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? nazwa,
  String? kodDolaczenia,
  DocumentReference? ownerRef,
  bool? trwaLikwidacjaLokalu,
  DateTime? dataLikwidacjiLokalu,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nazwa': nazwa,
      'kod_dolaczenia': kodDolaczenia,
      'owner_ref': ownerRef,
      'trwa_likwidacja_lokalu': trwaLikwidacjaLokalu,
      'data_likwidacji_lokalu': dataLikwidacjiLokalu,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    return e1?.nazwa == e2?.nazwa &&
        e1?.kodDolaczenia == e2?.kodDolaczenia &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.trwaLikwidacjaLokalu == e2?.trwaLikwidacjaLokalu &&
        e1?.dataLikwidacjiLokalu == e2?.dataLikwidacjiLokalu;
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.nazwa,
        e?.kodDolaczenia,
        e?.ownerRef,
        e?.trwaLikwidacjaLokalu,
        e?.dataLikwidacjiLokalu
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
