import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "task" field.
  String? _task;
  String get task => _task ?? '';
  bool hasTask() => _task != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _task = snapshotData['task'] as String?;
    _link = snapshotData['link'] as String?;
    _item = snapshotData['item'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? status,
  String? task,
  String? link,
  String? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'task': task,
      'link': link,
      'item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.task == e2?.task &&
        e1?.link == e2?.link &&
        e1?.item == e2?.item;
  }

  @override
  int hash(RequestsRecord? e) =>
      const ListEquality().hash([e?.status, e?.task, e?.link, e?.item]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
