import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'conversations_record.g.dart';

abstract class ConversationsRecord
    implements Built<ConversationsRecord, ConversationsRecordBuilder> {
  static Serializer<ConversationsRecord> get serializer =>
      _$conversationsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  String get name;

  @nullable
  bool get checkbox;

  @nullable
  @BuiltValueField(wireName: 'last_action')
  DateTime get lastAction;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ConversationsRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..name = ''
    ..checkbox = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConversationsRecord._();
  factory ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =
      _$ConversationsRecord;

  static ConversationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConversationsRecordData({
  DateTime createdAt,
  String name,
  bool checkbox,
  DateTime lastAction,
}) =>
    serializers.toFirestore(
        ConversationsRecord.serializer,
        ConversationsRecord((c) => c
          ..createdAt = createdAt
          ..users = null
          ..name = name
          ..checkbox = checkbox
          ..lastAction = lastAction));
