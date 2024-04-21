import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TweetsRecord extends FirestoreRecord {
  TweetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "user_profile_image" field.
  String? _userProfileImage;
  String get userProfileImage => _userProfileImage ?? '';
  bool hasUserProfileImage() => _userProfileImage != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _text = snapshotData['text'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _imageUrl = snapshotData['image_url'] as String?;
    _userProfileImage = snapshotData['user_profile_image'] as String?;
    _username = snapshotData['username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tweets');

  static Stream<TweetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TweetsRecord.fromSnapshot(s));

  static Future<TweetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TweetsRecord.fromSnapshot(s));

  static TweetsRecord fromSnapshot(DocumentSnapshot snapshot) => TweetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TweetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TweetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TweetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TweetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTweetsRecordData({
  String? userId,
  String? text,
  DateTime? createdTime,
  String? imageUrl,
  String? userProfileImage,
  String? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'text': text,
      'created_time': createdTime,
      'image_url': imageUrl,
      'user_profile_image': userProfileImage,
      'username': username,
    }.withoutNulls,
  );

  return firestoreData;
}

class TweetsRecordDocumentEquality implements Equality<TweetsRecord> {
  const TweetsRecordDocumentEquality();

  @override
  bool equals(TweetsRecord? e1, TweetsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.text == e2?.text &&
        e1?.createdTime == e2?.createdTime &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.userProfileImage == e2?.userProfileImage &&
        e1?.username == e2?.username;
  }

  @override
  int hash(TweetsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.text,
        e?.createdTime,
        e?.imageUrl,
        e?.userProfileImage,
        e?.username
      ]);

  @override
  bool isValidKey(Object? o) => o is TweetsRecord;
}
