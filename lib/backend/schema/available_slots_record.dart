import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableSlotsRecord extends FirestoreRecord {
  AvailableSlotsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "timeId" field.
  String? _timeId;
  String get timeId => _timeId ?? '';
  bool hasTimeId() => _timeId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _time = snapshotData['time'] as DateTime?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _timeId = snapshotData['timeId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('availableSlots')
          : FirebaseFirestore.instance.collectionGroup('availableSlots');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('availableSlots').doc(id);

  static Stream<AvailableSlotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailableSlotsRecord.fromSnapshot(s));

  static Future<AvailableSlotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailableSlotsRecord.fromSnapshot(s));

  static AvailableSlotsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailableSlotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailableSlotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailableSlotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailableSlotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailableSlotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailableSlotsRecordData({
  DateTime? time,
  DocumentReference? userid,
  bool? isAvailable,
  String? timeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'userid': userid,
      'isAvailable': isAvailable,
      'timeId': timeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailableSlotsRecordDocumentEquality
    implements Equality<AvailableSlotsRecord> {
  const AvailableSlotsRecordDocumentEquality();

  @override
  bool equals(AvailableSlotsRecord? e1, AvailableSlotsRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.userid == e2?.userid &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.timeId == e2?.timeId;
  }

  @override
  int hash(AvailableSlotsRecord? e) => const ListEquality()
      .hash([e?.time, e?.userid, e?.isAvailable, e?.timeId]);

  @override
  bool isValidKey(Object? o) => o is AvailableSlotsRecord;
}
