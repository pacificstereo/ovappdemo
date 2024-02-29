import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ClubsRecord extends FirestoreRecord {
  ClubsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  List<String>? _body;
  List<String> get body => _body ?? const [];
  bool hasBody() => _body != null;

  // "coverImage" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "albumImages" field.
  List<String>? _albumImages;
  List<String> get albumImages => _albumImages ?? const [];
  bool hasAlbumImages() => _albumImages != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "advisorName" field.
  String? _advisorName;
  String get advisorName => _advisorName ?? '';
  bool hasAdvisorName() => _advisorName != null;

  // "advisorEmail" field.
  String? _advisorEmail;
  String get advisorEmail => _advisorEmail ?? '';
  bool hasAdvisorEmail() => _advisorEmail != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _body = getDataList(snapshotData['body']);
    _coverImage = snapshotData['coverImage'] as String?;
    _mainImage = snapshotData['mainImage'] as String?;
    _albumImages = getDataList(snapshotData['albumImages']);
    _link = snapshotData['link'] as String?;
    _advisorName = snapshotData['advisorName'] as String?;
    _advisorEmail = snapshotData['advisorEmail'] as String?;
    _room = snapshotData['room'] as String?;
    _instagram = snapshotData['instagram'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubsRecord.fromSnapshot(s));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubsRecord.fromSnapshot(s));

  static ClubsRecord fromSnapshot(DocumentSnapshot snapshot) => ClubsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubsRecordData({
  String? title,
  String? coverImage,
  String? mainImage,
  String? link,
  String? advisorName,
  String? advisorEmail,
  String? room,
  String? instagram,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'coverImage': coverImage,
      'mainImage': mainImage,
      'link': link,
      'advisorName': advisorName,
      'advisorEmail': advisorEmail,
      'room': room,
      'instagram': instagram,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubsRecordDocumentEquality implements Equality<ClubsRecord> {
  const ClubsRecordDocumentEquality();

  @override
  bool equals(ClubsRecord? e1, ClubsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.body, e2?.body) &&
        e1?.coverImage == e2?.coverImage &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.albumImages, e2?.albumImages) &&
        e1?.link == e2?.link &&
        e1?.advisorName == e2?.advisorName &&
        e1?.advisorEmail == e2?.advisorEmail &&
        e1?.room == e2?.room &&
        e1?.instagram == e2?.instagram;
  }

  @override
  int hash(ClubsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.body,
        e?.coverImage,
        e?.mainImage,
        e?.albumImages,
        e?.link,
        e?.advisorName,
        e?.advisorEmail,
        e?.room,
        e?.instagram
      ]);

  @override
  bool isValidKey(Object? o) => o is ClubsRecord;
}
