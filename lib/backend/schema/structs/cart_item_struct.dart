// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends FFFirebaseStruct {
  CartItemStruct({
    DocumentReference? itemRef,
    int? quanity,
    double? totalPrice,
    List<DocumentReference>? sellerRef,
    DocumentReference? selRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemRef = itemRef,
        _quanity = quanity,
        _totalPrice = totalPrice,
        _sellerRef = sellerRef,
        _selRef = selRef,
        super(firestoreUtilData);

  // "itemRef" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  set itemRef(DocumentReference? val) => _itemRef = val;
  bool hasItemRef() => _itemRef != null;

  // "quanity" field.
  int? _quanity;
  int get quanity => _quanity ?? 0;
  set quanity(int? val) => _quanity = val;
  void incrementQuanity(int amount) => _quanity = quanity + amount;
  bool hasQuanity() => _quanity != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  // "sellerRef" field.
  List<DocumentReference>? _sellerRef;
  List<DocumentReference> get sellerRef => _sellerRef ?? const [];
  set sellerRef(List<DocumentReference>? val) => _sellerRef = val;
  void updateSellerRef(Function(List<DocumentReference>) updateFn) =>
      updateFn(_sellerRef ??= []);
  bool hasSellerRef() => _sellerRef != null;

  // "SelRef" field.
  DocumentReference? _selRef;
  DocumentReference? get selRef => _selRef;
  set selRef(DocumentReference? val) => _selRef = val;
  bool hasSelRef() => _selRef != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        itemRef: data['itemRef'] as DocumentReference?,
        quanity: castToType<int>(data['quanity']),
        totalPrice: castToType<double>(data['totalPrice']),
        sellerRef: getDataList(data['sellerRef']),
        selRef: data['SelRef'] as DocumentReference?,
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'itemRef': _itemRef,
        'quanity': _quanity,
        'totalPrice': _totalPrice,
        'sellerRef': _sellerRef,
        'SelRef': _selRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemRef': serializeParam(
          _itemRef,
          ParamType.DocumentReference,
        ),
        'quanity': serializeParam(
          _quanity,
          ParamType.int,
        ),
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'sellerRef': serializeParam(
          _sellerRef,
          ParamType.DocumentReference,
          true,
        ),
        'SelRef': serializeParam(
          _selRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        itemRef: deserializeParam(
          data['itemRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        quanity: deserializeParam(
          data['quanity'],
          ParamType.int,
          false,
        ),
        totalPrice: deserializeParam(
          data['totalPrice'],
          ParamType.double,
          false,
        ),
        sellerRef: deserializeParam<DocumentReference>(
          data['sellerRef'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['sellers'],
        ),
        selRef: deserializeParam(
          data['SelRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['sellers'],
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartItemStruct &&
        itemRef == other.itemRef &&
        quanity == other.quanity &&
        totalPrice == other.totalPrice &&
        listEquality.equals(sellerRef, other.sellerRef) &&
        selRef == other.selRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([itemRef, quanity, totalPrice, sellerRef, selRef]);
}

CartItemStruct createCartItemStruct({
  DocumentReference? itemRef,
  int? quanity,
  double? totalPrice,
  DocumentReference? selRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemStruct(
      itemRef: itemRef,
      quanity: quanity,
      totalPrice: totalPrice,
      selRef: selRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemStruct? updateCartItemStruct(
  CartItemStruct? cartItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemStructData(
  Map<String, dynamic> firestoreData,
  CartItemStruct? cartItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItem == null) {
    return;
  }
  if (cartItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemData = getCartItemFirestoreData(cartItem, forFieldValue);
  final nestedData = cartItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemFirestoreData(
  CartItemStruct? cartItem, [
  bool forFieldValue = false,
]) {
  if (cartItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItem.toMap());

  // Add any Firestore field values
  cartItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemListFirestoreData(
  List<CartItemStruct>? cartItems,
) =>
    cartItems?.map((e) => getCartItemFirestoreData(e, true)).toList() ?? [];
