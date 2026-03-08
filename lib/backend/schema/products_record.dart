import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "is_gluten_free" field.
  bool? _isGlutenFree;
  bool get isGlutenFree => _isGlutenFree ?? false;
  bool hasIsGlutenFree() => _isGlutenFree != null;

  // "contains_eggs" field.
  bool? _containsEggs;
  bool get containsEggs => _containsEggs ?? false;
  bool hasContainsEggs() => _containsEggs != null;

  // "contains_milk" field.
  bool? _containsMilk;
  bool get containsMilk => _containsMilk ?? false;
  bool hasContainsMilk() => _containsMilk != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _category = snapshotData['category'] as String?;
    _calories = castToType<int>(snapshotData['calories']);
    _description = snapshotData['description'] as String?;
    _isGlutenFree = snapshotData['is_gluten_free'] as bool?;
    _containsEggs = snapshotData['contains_eggs'] as bool?;
    _containsMilk = snapshotData['contains_milk'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  int? price,
  String? category,
  int? calories,
  String? description,
  bool? isGlutenFree,
  bool? containsEggs,
  bool? containsMilk,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'category': category,
      'calories': calories,
      'description': description,
      'is_gluten_free': isGlutenFree,
      'contains_eggs': containsEggs,
      'contains_milk': containsMilk,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.category == e2?.category &&
        e1?.calories == e2?.calories &&
        e1?.description == e2?.description &&
        e1?.isGlutenFree == e2?.isGlutenFree &&
        e1?.containsEggs == e2?.containsEggs &&
        e1?.containsMilk == e2?.containsMilk;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.category,
        e?.calories,
        e?.description,
        e?.isGlutenFree,
        e?.containsEggs,
        e?.containsMilk
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
