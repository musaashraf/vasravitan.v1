import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellersRecord extends FirestoreRecord {
  SellersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "store_number" field.
  String? _storeNumber;
  String get storeNumber => _storeNumber ?? '';
  bool hasStoreNumber() => _storeNumber != null;

  // "store_nid" field.
  String? _storeNid;
  String get storeNid => _storeNid ?? '';
  bool hasStoreNid() => _storeNid != null;

  // "store_location" field.
  String? _storeLocation;
  String get storeLocation => _storeLocation ?? '';
  bool hasStoreLocation() => _storeLocation != null;

  // "sellerRef" field.
  String? _sellerRef;
  String get sellerRef => _sellerRef ?? '';
  bool hasSellerRef() => _sellerRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _storeName = snapshotData['store_name'] as String?;
    _storeNumber = snapshotData['store_number'] as String?;
    _storeNid = snapshotData['store_nid'] as String?;
    _storeLocation = snapshotData['store_location'] as String?;
    _sellerRef = snapshotData['sellerRef'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellersRecord.fromSnapshot(s));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellersRecord.fromSnapshot(s));

  static SellersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellersRecordData({
  String? email,
  String? photoUrl,
  String? phoneNumber,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? storeName,
  String? storeNumber,
  String? storeNid,
  String? storeLocation,
  String? sellerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'created_at': createdAt,
      'userRef': userRef,
      'store_name': storeName,
      'store_number': storeNumber,
      'store_nid': storeNid,
      'store_location': storeLocation,
      'sellerRef': sellerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellersRecordDocumentEquality implements Equality<SellersRecord> {
  const SellersRecordDocumentEquality();

  @override
  bool equals(SellersRecord? e1, SellersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.storeName == e2?.storeName &&
        e1?.storeNumber == e2?.storeNumber &&
        e1?.storeNid == e2?.storeNid &&
        e1?.storeLocation == e2?.storeLocation &&
        e1?.sellerRef == e2?.sellerRef;
  }

  @override
  int hash(SellersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.phoneNumber,
        e?.createdAt,
        e?.userRef,
        e?.storeName,
        e?.storeNumber,
        e?.storeNid,
        e?.storeLocation,
        e?.sellerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SellersRecord;
}
