import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "interests" field.
  String? _interests;
  String get interests => _interests ?? '';
  bool hasInterests() => _interests != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "speciality" field.
  String? _speciality;
  String get speciality => _speciality ?? '';
  bool hasSpeciality() => _speciality != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _interests = snapshotData['interests'] as String?;
    _password = snapshotData['password'] as String?;
    _speciality = snapshotData['speciality'] as String?;
    _about = snapshotData['about'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
  String? name,
  String? email,
  String? phoneNumber,
  String? interests,
  String? password,
  String? speciality,
  String? about,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'interests': interests,
      'password': password,
      'speciality': speciality,
      'about': about,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.interests == e2?.interests &&
        e1?.password == e2?.password &&
        e1?.speciality == e2?.speciality &&
        e1?.about == e2?.about &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(DoctorsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.phoneNumber,
        e?.interests,
        e?.password,
        e?.speciality,
        e?.about,
        e?.photo
      ]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
