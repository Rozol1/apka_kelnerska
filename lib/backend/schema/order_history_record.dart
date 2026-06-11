import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderHistoryRecord extends FirestoreRecord {
  OrderHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "table_name" field.
  String? _tableName;
  String get tableName => _tableName ?? '';
  bool hasTableName() => _tableName != null;

  // "order_time" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "cena" field.
  double? _cena;
  double get cena => _cena ?? 0.0;
  bool hasCena() => _cena != null;

  // "restaurant_ref" field.
  DocumentReference? _restaurantRef;
  DocumentReference? get restaurantRef => _restaurantRef;
  bool hasRestaurantRef() => _restaurantRef != null;

  // "szczegoly_zamowienia" field.
  List<String>? _szczegolyZamowienia;
  List<String> get szczegolyZamowienia => _szczegolyZamowienia ?? const [];
  bool hasSzczegolyZamowienia() => _szczegolyZamowienia != null;

  // "wygasa_dnia" field.
  DateTime? _wygasaDnia;
  DateTime? get wygasaDnia => _wygasaDnia;
  bool hasWygasaDnia() => _wygasaDnia != null;

  void _initializeFields() {
    _tableName = snapshotData['table_name'] as String?;
    _orderTime = snapshotData['order_time'] as DateTime?;
    _cena = castToType<double>(snapshotData['cena']);
    _restaurantRef = snapshotData['restaurant_ref'] as DocumentReference?;
    _szczegolyZamowienia = getDataList(snapshotData['szczegoly_zamowienia']);
    _wygasaDnia = snapshotData['wygasa_dnia'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_history');

  static Stream<OrderHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderHistoryRecord.fromSnapshot(s));

  static Future<OrderHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderHistoryRecord.fromSnapshot(s));

  static OrderHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderHistoryRecordData({
  String? tableName,
  DateTime? orderTime,
  double? cena,
  DocumentReference? restaurantRef,
  DateTime? wygasaDnia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'table_name': tableName,
      'order_time': orderTime,
      'cena': cena,
      'restaurant_ref': restaurantRef,
      'wygasa_dnia': wygasaDnia,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderHistoryRecordDocumentEquality
    implements Equality<OrderHistoryRecord> {
  const OrderHistoryRecordDocumentEquality();

  @override
  bool equals(OrderHistoryRecord? e1, OrderHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tableName == e2?.tableName &&
        e1?.orderTime == e2?.orderTime &&
        e1?.cena == e2?.cena &&
        e1?.restaurantRef == e2?.restaurantRef &&
        listEquality.equals(e1?.szczegolyZamowienia, e2?.szczegolyZamowienia) &&
        e1?.wygasaDnia == e2?.wygasaDnia;
  }

  @override
  int hash(OrderHistoryRecord? e) => const ListEquality().hash([
        e?.tableName,
        e?.orderTime,
        e?.cena,
        e?.restaurantRef,
        e?.szczegolyZamowienia,
        e?.wygasaDnia
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderHistoryRecord;
}
