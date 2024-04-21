import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "friendship_level" field.
  String? _friendshipLevel;
  String get friendshipLevel => _friendshipLevel ?? '';
  bool hasFriendshipLevel() => _friendshipLevel != null;

  void _initializeFields() {
    _profileImage = snapshotData['profile_image'] as String?;
    _username = snapshotData['username'] as String?;
    _friendshipLevel = snapshotData['friendship_level'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friends');

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  String? profileImage,
  String? username,
  String? friendshipLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profile_image': profileImage,
      'username': username,
      'friendship_level': friendshipLevel,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.profileImage == e2?.profileImage &&
        e1?.username == e2?.username &&
        e1?.friendshipLevel == e2?.friendshipLevel;
  }

  @override
  int hash(FriendsRecord? e) => const ListEquality()
      .hash([e?.profileImage, e?.username, e?.friendshipLevel]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
