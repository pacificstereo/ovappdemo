import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HomePageRecord extends FirestoreRecord {
  HomePageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  List<String>? _body;
  List<String> get body => _body ?? const [];
  bool hasBody() => _body != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "articleList" field.
  List<DocumentReference>? _articleList;
  List<DocumentReference> get articleList => _articleList ?? const [];
  bool hasArticleList() => _articleList != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  // "clubRef" field.
  DocumentReference? _clubRef;
  DocumentReference? get clubRef => _clubRef;
  bool hasClubRef() => _clubRef != null;

  // "businessRef" field.
  DocumentReference? _businessRef;
  DocumentReference? get businessRef => _businessRef;
  bool hasBusinessRef() => _businessRef != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _title = snapshotData['title'] as String?;
    _body = getDataList(snapshotData['body']);
    _link = snapshotData['link'] as String?;
    _articleList = getDataList(snapshotData['articleList']);
    _image = snapshotData['image'] as String?;
    _ref = snapshotData['ref'] as DocumentReference?;
    _clubRef = snapshotData['clubRef'] as DocumentReference?;
    _businessRef = snapshotData['businessRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('homePage');

  static Stream<HomePageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomePageRecord.fromSnapshot(s));

  static Future<HomePageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HomePageRecord.fromSnapshot(s));

  static HomePageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomePageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomePageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomePageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomePageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomePageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomePageRecordData({
  String? id,
  String? title,
  String? link,
  String? image,
  DocumentReference? ref,
  DocumentReference? clubRef,
  DocumentReference? businessRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'title': title,
      'link': link,
      'image': image,
      'ref': ref,
      'clubRef': clubRef,
      'businessRef': businessRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomePageRecordDocumentEquality implements Equality<HomePageRecord> {
  const HomePageRecordDocumentEquality();

  @override
  bool equals(HomePageRecord? e1, HomePageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.body, e2?.body) &&
        e1?.link == e2?.link &&
        listEquality.equals(e1?.articleList, e2?.articleList) &&
        e1?.image == e2?.image &&
        e1?.ref == e2?.ref &&
        e1?.clubRef == e2?.clubRef &&
        e1?.businessRef == e2?.businessRef;
  }

  @override
  int hash(HomePageRecord? e) => const ListEquality().hash([
        e?.id,
        e?.title,
        e?.body,
        e?.link,
        e?.articleList,
        e?.image,
        e?.ref,
        e?.clubRef,
        e?.businessRef
      ]);

  @override
  bool isValidKey(Object? o) => o is HomePageRecord;
}
