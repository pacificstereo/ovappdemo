import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

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

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = getDataList(snapshotData['body']);
    _coverImage = snapshotData['coverImage'] as String?;
    _mainImage = snapshotData['mainImage'] as String?;
    _albumImages = getDataList(snapshotData['albumImages']);
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  DateTime? date,
  String? title,
  String? coverImage,
  String? mainImage,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'title': title,
      'coverImage': coverImage,
      'mainImage': mainImage,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.body, e2?.body) &&
        e1?.coverImage == e2?.coverImage &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.albumImages, e2?.albumImages) &&
        e1?.link == e2?.link;
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.date,
        e?.title,
        e?.body,
        e?.coverImage,
        e?.mainImage,
        e?.albumImages,
        e?.link
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
