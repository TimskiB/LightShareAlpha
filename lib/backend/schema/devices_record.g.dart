// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DevicesRecord> _$devicesRecordSerializer =
    new _$DevicesRecordSerializer();

class _$DevicesRecordSerializer implements StructuredSerializer<DevicesRecord> {
  @override
  final Iterable<Type> types = const [DevicesRecord, _$DevicesRecord];
  @override
  final String wireName = 'DevicesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DevicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deviceId;
    if (value != null) {
      result
        ..add('device_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastUsed;
    if (value != null) {
      result
        ..add('last_used')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userIdStr;
    if (value != null) {
      result
        ..add('user_id_str')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userReference;
    if (value != null) {
      result
        ..add('user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.checkbox;
    if (value != null) {
      result
        ..add('checkbox')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DevicesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DevicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'device_id':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_used':
          result.lastUsed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user_id_str':
          result.userIdStr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_reference':
          result.userReference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'checkbox':
          result.checkbox = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DevicesRecord extends DevicesRecord {
  @override
  final String name;
  @override
  final String deviceId;
  @override
  final String description;
  @override
  final DateTime lastUsed;
  @override
  final String userIdStr;
  @override
  final DocumentReference<Object> userReference;
  @override
  final bool checkbox;
  @override
  final DocumentReference<Object> reference;

  factory _$DevicesRecord([void Function(DevicesRecordBuilder) updates]) =>
      (new DevicesRecordBuilder()..update(updates)).build();

  _$DevicesRecord._(
      {this.name,
      this.deviceId,
      this.description,
      this.lastUsed,
      this.userIdStr,
      this.userReference,
      this.checkbox,
      this.reference})
      : super._();

  @override
  DevicesRecord rebuild(void Function(DevicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DevicesRecordBuilder toBuilder() => new DevicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DevicesRecord &&
        name == other.name &&
        deviceId == other.deviceId &&
        description == other.description &&
        lastUsed == other.lastUsed &&
        userIdStr == other.userIdStr &&
        userReference == other.userReference &&
        checkbox == other.checkbox &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), deviceId.hashCode),
                            description.hashCode),
                        lastUsed.hashCode),
                    userIdStr.hashCode),
                userReference.hashCode),
            checkbox.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DevicesRecord')
          ..add('name', name)
          ..add('deviceId', deviceId)
          ..add('description', description)
          ..add('lastUsed', lastUsed)
          ..add('userIdStr', userIdStr)
          ..add('userReference', userReference)
          ..add('checkbox', checkbox)
          ..add('reference', reference))
        .toString();
  }
}

class DevicesRecordBuilder
    implements Builder<DevicesRecord, DevicesRecordBuilder> {
  _$DevicesRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _deviceId;
  String get deviceId => _$this._deviceId;
  set deviceId(String deviceId) => _$this._deviceId = deviceId;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DateTime _lastUsed;
  DateTime get lastUsed => _$this._lastUsed;
  set lastUsed(DateTime lastUsed) => _$this._lastUsed = lastUsed;

  String _userIdStr;
  String get userIdStr => _$this._userIdStr;
  set userIdStr(String userIdStr) => _$this._userIdStr = userIdStr;

  DocumentReference<Object> _userReference;
  DocumentReference<Object> get userReference => _$this._userReference;
  set userReference(DocumentReference<Object> userReference) =>
      _$this._userReference = userReference;

  bool _checkbox;
  bool get checkbox => _$this._checkbox;
  set checkbox(bool checkbox) => _$this._checkbox = checkbox;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DevicesRecordBuilder() {
    DevicesRecord._initializeBuilder(this);
  }

  DevicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _deviceId = $v.deviceId;
      _description = $v.description;
      _lastUsed = $v.lastUsed;
      _userIdStr = $v.userIdStr;
      _userReference = $v.userReference;
      _checkbox = $v.checkbox;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DevicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DevicesRecord;
  }

  @override
  void update(void Function(DevicesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DevicesRecord build() {
    final _$result = _$v ??
        new _$DevicesRecord._(
            name: name,
            deviceId: deviceId,
            description: description,
            lastUsed: lastUsed,
            userIdStr: userIdStr,
            userReference: userReference,
            checkbox: checkbox,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
