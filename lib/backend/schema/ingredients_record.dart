import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class IngredientsRecord extends FirestoreRecord {
  IngredientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ingredients')
          : FirebaseFirestore.instance.collectionGroup('ingredients');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ingredients').doc(id);

  static Stream<IngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredientsRecord.fromSnapshot(s));

  static Future<IngredientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngredientsRecord.fromSnapshot(s));

  static IngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredientsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredientsRecordDocumentEquality implements Equality<IngredientsRecord> {
  const IngredientsRecordDocumentEquality();

  @override
  bool equals(IngredientsRecord? e1, IngredientsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(IngredientsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is IngredientsRecord;
}
