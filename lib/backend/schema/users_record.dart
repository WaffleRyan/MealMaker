import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "dailycalories" field.
  int? _dailycalories;
  int get dailycalories => _dailycalories ?? 0;
  bool hasDailycalories() => _dailycalories != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  bool hasProgress() => _progress != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _weight = castToType<int>(snapshotData['weight']);
    _height = castToType<int>(snapshotData['height']);
    _goal = snapshotData['goal'] as String?;
    _activity = snapshotData['activity'] as String?;
    _sex = snapshotData['sex'] as String?;
    _dailycalories = castToType<int>(snapshotData['dailycalories']);
    _calories = castToType<int>(snapshotData['calories']);
    _progress = castToType<double>(snapshotData['progress']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  int? age,
  int? weight,
  int? height,
  String? goal,
  String? activity,
  String? sex,
  int? dailycalories,
  int? calories,
  double? progress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'age': age,
      'weight': weight,
      'height': height,
      'goal': goal,
      'activity': activity,
      'sex': sex,
      'dailycalories': dailycalories,
      'calories': calories,
      'progress': progress,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.age == e2?.age &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.goal == e2?.goal &&
        e1?.activity == e2?.activity &&
        e1?.sex == e2?.sex &&
        e1?.dailycalories == e2?.dailycalories &&
        e1?.calories == e2?.calories &&
        e1?.progress == e2?.progress;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.age,
        e?.weight,
        e?.height,
        e?.goal,
        e?.activity,
        e?.sex,
        e?.dailycalories,
        e?.calories,
        e?.progress
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
