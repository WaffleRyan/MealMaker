import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _calories = castToType<int>(snapshotData['calories']);
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recipes')
          : FirebaseFirestore.instance.collectionGroup('recipes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('recipes').doc(id);

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  int? calories,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'calories': calories,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    return e1?.calories == e2?.calories && e1?.name == e2?.name;
  }

  @override
  int hash(RecipesRecord? e) =>
      const ListEquality().hash([e?.calories, e?.name]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
