import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActualitesRecord extends FirestoreRecord {
  ActualitesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actualites');

  static Stream<ActualitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActualitesRecord.fromSnapshot(s));

  static Future<ActualitesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActualitesRecord.fromSnapshot(s));

  static ActualitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActualitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActualitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActualitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActualitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActualitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActualitesRecordData({
  String? title,
  DateTime? date,
  String? content,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'date': date,
      'content': content,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActualitesRecordDocumentEquality implements Equality<ActualitesRecord> {
  const ActualitesRecordDocumentEquality();

  @override
  bool equals(ActualitesRecord? e1, ActualitesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.date == e2?.date &&
        e1?.content == e2?.content &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ActualitesRecord? e) =>
      const ListEquality().hash([e?.title, e?.date, e?.content, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ActualitesRecord;
}
