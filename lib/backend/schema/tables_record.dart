import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "table_id" field.
  int? _tableId;
  int get tableId => _tableId ?? 0;
  bool hasTableId() => _tableId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "guests_count" field.
  int? _guestsCount;
  int get guestsCount => _guestsCount ?? 0;
  bool hasGuestsCount() => _guestsCount != null;

  // "czas_zmiany_statusu" field.
  DateTime? _czasZmianyStatusu;
  DateTime? get czasZmianyStatusu => _czasZmianyStatusu;
  bool hasCzasZmianyStatusu() => _czasZmianyStatusu != null;

  // "restaurant_ref" field.
  DocumentReference? _restaurantRef;
  DocumentReference? get restaurantRef => _restaurantRef;
  bool hasRestaurantRef() => _restaurantRef != null;

  void _initializeFields() {
    _tableId = castToType<int>(snapshotData['table_id']);
    _status = snapshotData['status'] as String?;
    _guestsCount = castToType<int>(snapshotData['guests_count']);
    _czasZmianyStatusu = snapshotData['czas_zmiany_statusu'] as DateTime?;
    _restaurantRef = snapshotData['restaurant_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tables');

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  int? tableId,
  String? status,
  int? guestsCount,
  DateTime? czasZmianyStatusu,
  DocumentReference? restaurantRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'table_id': tableId,
      'status': status,
      'guests_count': guestsCount,
      'czas_zmiany_statusu': czasZmianyStatusu,
      'restaurant_ref': restaurantRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TablesRecordDocumentEquality implements Equality<TablesRecord> {
  const TablesRecordDocumentEquality();

  @override
  bool equals(TablesRecord? e1, TablesRecord? e2) {
    return e1?.tableId == e2?.tableId &&
        e1?.status == e2?.status &&
        e1?.guestsCount == e2?.guestsCount &&
        e1?.czasZmianyStatusu == e2?.czasZmianyStatusu &&
        e1?.restaurantRef == e2?.restaurantRef;
  }

  @override
  int hash(TablesRecord? e) => const ListEquality().hash([
        e?.tableId,
        e?.status,
        e?.guestsCount,
        e?.czasZmianyStatusu,
        e?.restaurantRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TablesRecord;
}
