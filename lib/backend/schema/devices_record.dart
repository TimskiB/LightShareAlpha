import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'devices_record.g.dart';

abstract class DevicesRecord
    implements Built<DevicesRecord, DevicesRecordBuilder> {
  static Serializer<DevicesRecord> get serializer => _$devicesRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'device_id')
  String get deviceId;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'last_used')
  DateTime get lastUsed;

  @nullable
  @BuiltValueField(wireName: 'user_id_str')
  String get userIdStr;

  @nullable
  @BuiltValueField(wireName: 'user_reference')
  DocumentReference get userReference;

  @nullable
  bool get checkbox;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DevicesRecordBuilder builder) => builder
    ..name = ''
    ..deviceId = ''
    ..description = ''
    ..userIdStr = ''
    ..checkbox = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devices');

  static Stream<DevicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DevicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DevicesRecord._();
  factory DevicesRecord([void Function(DevicesRecordBuilder) updates]) =
      _$DevicesRecord;

  static DevicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDevicesRecordData({
  String name,
  String deviceId,
  String description,
  DateTime lastUsed,
  String userIdStr,
  DocumentReference userReference,
  bool checkbox,
}) =>
    serializers.toFirestore(
        DevicesRecord.serializer,
        DevicesRecord((d) => d
          ..name = name
          ..deviceId = deviceId
          ..description = description
          ..lastUsed = lastUsed
          ..userIdStr = userIdStr
          ..userReference = userReference
          ..checkbox = checkbox));
