import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderedItemsRecord extends FirestoreRecord {
  OrderedItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "item_total_price" field.
  double? _itemTotalPrice;
  double get itemTotalPrice => _itemTotalPrice ?? 0.0;
  bool hasItemTotalPrice() => _itemTotalPrice != null;

  // "czy_dostarczone" field.
  bool? _czyDostarczone;
  bool get czyDostarczone => _czyDostarczone ?? false;
  bool hasCzyDostarczone() => _czyDostarczone != null;

  // "restaurant_ref" field.
  DocumentReference? _restaurantRef;
  DocumentReference? get restaurantRef => _restaurantRef;
  bool hasRestaurantRef() => _restaurantRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _comment = snapshotData['comment'] as String?;
    _itemTotalPrice = castToType<double>(snapshotData['item_total_price']);
    _czyDostarczone = snapshotData['czy_dostarczone'] as bool?;
    _restaurantRef = snapshotData['restaurant_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ordered_items')
          : FirebaseFirestore.instance.collectionGroup('ordered_items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ordered_items').doc(id);

  static Stream<OrderedItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderedItemsRecord.fromSnapshot(s));

  static Future<OrderedItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderedItemsRecord.fromSnapshot(s));

  static OrderedItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderedItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderedItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderedItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderedItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderedItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderedItemsRecordData({
  DocumentReference? productRef,
  int? quantity,
  String? comment,
  double? itemTotalPrice,
  bool? czyDostarczone,
  DocumentReference? restaurantRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_ref': productRef,
      'quantity': quantity,
      'comment': comment,
      'item_total_price': itemTotalPrice,
      'czy_dostarczone': czyDostarczone,
      'restaurant_ref': restaurantRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderedItemsRecordDocumentEquality
    implements Equality<OrderedItemsRecord> {
  const OrderedItemsRecordDocumentEquality();

  @override
  bool equals(OrderedItemsRecord? e1, OrderedItemsRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.comment == e2?.comment &&
        e1?.itemTotalPrice == e2?.itemTotalPrice &&
        e1?.czyDostarczone == e2?.czyDostarczone &&
        e1?.restaurantRef == e2?.restaurantRef;
  }

  @override
  int hash(OrderedItemsRecord? e) => const ListEquality().hash([
        e?.productRef,
        e?.quantity,
        e?.comment,
        e?.itemTotalPrice,
        e?.czyDostarczone,
        e?.restaurantRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderedItemsRecord;
}
