import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "pid" field.
  String? _pid;
  String get pid => _pid ?? '';
  bool hasPid() => _pid != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "seller_ref" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "photo_url1" field.
  String? _photoUrl1;
  String get photoUrl1 => _photoUrl1 ?? '';
  bool hasPhotoUrl1() => _photoUrl1 != null;

  // "photo_url2" field.
  String? _photoUrl2;
  String get photoUrl2 => _photoUrl2 ?? '';
  bool hasPhotoUrl2() => _photoUrl2 != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_price" field.
  double? _productPrice;
  double get productPrice => _productPrice ?? 0.0;
  bool hasProductPrice() => _productPrice != null;

  // "product_quantity" field.
  int? _productQuantity;
  int get productQuantity => _productQuantity ?? 0;
  bool hasProductQuantity() => _productQuantity != null;

  // "product_brand" field.
  String? _productBrand;
  String get productBrand => _productBrand ?? '';
  bool hasProductBrand() => _productBrand != null;

  // "product_size" field.
  String? _productSize;
  String get productSize => _productSize ?? '';
  bool hasProductSize() => _productSize != null;

  // "product_category" field.
  String? _productCategory;
  String get productCategory => _productCategory ?? '';
  bool hasProductCategory() => _productCategory != null;

  // "product_shippingCharge" field.
  double? _productShippingCharge;
  double get productShippingCharge => _productShippingCharge ?? 0.0;
  bool hasProductShippingCharge() => _productShippingCharge != null;

  // "product_description" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  bool hasProductDescription() => _productDescription != null;

  // "isPublished" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  // "productRef" field.
  String? _productRef;
  String get productRef => _productRef ?? '';
  bool hasProductRef() => _productRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _pid = snapshotData['pid'] as String?;
    _category = snapshotData['category'] as String?;
    _sellerRef = snapshotData['seller_ref'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _photoUrl1 = snapshotData['photo_url1'] as String?;
    _photoUrl2 = snapshotData['photo_url2'] as String?;
    _productName = snapshotData['product_name'] as String?;
    _productPrice = castToType<double>(snapshotData['product_price']);
    _productQuantity = castToType<int>(snapshotData['product_quantity']);
    _productBrand = snapshotData['product_brand'] as String?;
    _productSize = snapshotData['product_size'] as String?;
    _productCategory = snapshotData['product_category'] as String?;
    _productShippingCharge =
        castToType<double>(snapshotData['product_shippingCharge']);
    _productDescription = snapshotData['product_description'] as String?;
    _isPublished = snapshotData['isPublished'] as bool?;
    _productRef = snapshotData['productRef'] as String?;
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
  String? description,
  DateTime? createdAt,
  String? pid,
  String? category,
  DocumentReference? sellerRef,
  String? photoUrl,
  DocumentReference? userRef,
  String? photoUrl1,
  String? photoUrl2,
  String? productName,
  double? productPrice,
  int? productQuantity,
  String? productBrand,
  String? productSize,
  String? productCategory,
  double? productShippingCharge,
  String? productDescription,
  bool? isPublished,
  String? productRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'created_at': createdAt,
      'pid': pid,
      'category': category,
      'seller_ref': sellerRef,
      'photo_url': photoUrl,
      'userRef': userRef,
      'photo_url1': photoUrl1,
      'photo_url2': photoUrl2,
      'product_name': productName,
      'product_price': productPrice,
      'product_quantity': productQuantity,
      'product_brand': productBrand,
      'product_size': productSize,
      'product_category': productCategory,
      'product_shippingCharge': productShippingCharge,
      'product_description': productDescription,
      'isPublished': isPublished,
      'productRef': productRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.pid == e2?.pid &&
        e1?.category == e2?.category &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.userRef == e2?.userRef &&
        e1?.photoUrl1 == e2?.photoUrl1 &&
        e1?.photoUrl2 == e2?.photoUrl2 &&
        e1?.productName == e2?.productName &&
        e1?.productPrice == e2?.productPrice &&
        e1?.productQuantity == e2?.productQuantity &&
        e1?.productBrand == e2?.productBrand &&
        e1?.productSize == e2?.productSize &&
        e1?.productCategory == e2?.productCategory &&
        e1?.productShippingCharge == e2?.productShippingCharge &&
        e1?.productDescription == e2?.productDescription &&
        e1?.isPublished == e2?.isPublished &&
        e1?.productRef == e2?.productRef;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.createdAt,
        e?.pid,
        e?.category,
        e?.sellerRef,
        e?.photoUrl,
        e?.userRef,
        e?.photoUrl1,
        e?.photoUrl2,
        e?.productName,
        e?.productPrice,
        e?.productQuantity,
        e?.productBrand,
        e?.productSize,
        e?.productCategory,
        e?.productShippingCharge,
        e?.productDescription,
        e?.isPublished,
        e?.productRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
