import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'files_record.g.dart';

abstract class FilesRecord implements Built<FilesRecord, FilesRecordBuilder> {
  static Serializer<FilesRecord> get serializer => _$filesRecordSerializer;

  @nullable
  DateTime get created;

  @nullable
  String get name;

  @nullable
  BuiltList<DocumentReference> get shared;

  @nullable
  double get size;

  @nullable
  String get type;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FilesRecordBuilder builder) => builder
    ..name = ''
    ..shared = ListBuilder()
    ..size = 0.0
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('files');

  static Stream<FilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FilesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FilesRecord._();
  factory FilesRecord([void Function(FilesRecordBuilder) updates]) =
      _$FilesRecord;

  static FilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFilesRecordData({
  DateTime created,
  String name,
  double size,
  String type,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        FilesRecord.serializer,
        FilesRecord((f) => f
          ..created = created
          ..name = name
          ..shared = null
          ..size = size
          ..type = type
          ..user = user));
