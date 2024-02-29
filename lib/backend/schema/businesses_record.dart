import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BusinessesRecord extends FirestoreRecord {
  BusinessesRecord._(
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

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _body = getDataList(snapshotData['body']);
    _coverImage = snapshotData['coverImage'] as String?;
    _mainImage = snapshotData['mainImage'] as String?;
    _albumImages = getDataList(snapshotData['albumImages']);
    _link = snapshotData['link'] as String?;
    _advisorName = snapshotData['advisorName'] as String?;
    _advisorEmail = snapshotData['advisorEmail'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _phone = snapshotData['phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('businesses');

  static Stream<BusinessesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessesRecord.fromSnapshot(s));

  static Future<BusinessesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessesRecord.fromSnapshot(s));

  static BusinessesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessesRecordData({
  String? title,
  String? coverImage,
  String? mainImage,
  String? link,
  String? advisorName,
  String? advisorEmail,
  String? instagram,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'coverImage': coverImage,
      'mainImage': mainImage,
      'link': link,
      'advisorName': advisorName,
      'advisorEmail': advisorEmail,
      'instagram': instagram,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessesRecordDocumentEquality implements Equality<BusinessesRecord> {
  const BusinessesRecordDocumentEquality();

  @override
  bool equals(BusinessesRecord? e1, BusinessesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.body, e2?.body) &&
        e1?.coverImage == e2?.coverImage &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.albumImages, e2?.albumImages) &&
        e1?.link == e2?.link &&
        e1?.advisorName == e2?.advisorName &&
        e1?.advisorEmail == e2?.advisorEmail &&
        e1?.instagram == e2?.instagram &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(BusinessesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.body,
        e?.coverImage,
        e?.mainImage,
        e?.albumImages,
        e?.link,
        e?.advisorName,
        e?.advisorEmail,
        e?.instagram,
        e?.phone
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessesRecord;
}
