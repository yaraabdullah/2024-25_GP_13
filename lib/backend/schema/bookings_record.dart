import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "time" field.
  double? _time;
  double get time => _time ?? 0.0;
  bool hasTime() => _time != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "bookingid" field.
  DocumentReference? _bookingid;
  DocumentReference? get bookingid => _bookingid;
  bool hasBookingid() => _bookingid != null;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _time = castToType<double>(snapshotData['time']);
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _about = snapshotData['about'] as String?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _bookingid = snapshotData['bookingid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  String? date,
  double? time,
  DocumentReference? doctor,
  String? name,
  int? age,
  String? about,
  DocumentReference? userid,
  DocumentReference? bookingid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'time': time,
      'doctor': doctor,
      'name': name,
      'age': age,
      'about': about,
      'userid': userid,
      'bookingid': bookingid,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.doctor == e2?.doctor &&
        e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.about == e2?.about &&
        e1?.userid == e2?.userid &&
        e1?.bookingid == e2?.bookingid;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.time,
        e?.doctor,
        e?.name,
        e?.age,
        e?.about,
        e?.userid,
        e?.bookingid
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
