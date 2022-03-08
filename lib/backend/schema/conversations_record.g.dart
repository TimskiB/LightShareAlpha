// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationsRecord> _$conversationsRecordSerializer =
    new _$ConversationsRecordSerializer();

class _$ConversationsRecordSerializer
    implements StructuredSerializer<ConversationsRecord> {
  @override
  final Iterable<Type> types = const [
    ConversationsRecord,
    _$ConversationsRecord
  ];
  @override
  final String wireName = 'ConversationsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConversationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.checkbox;
    if (value != null) {
      result
        ..add('checkbox')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastAction;
    if (value != null) {
      result
        ..add('last_action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ConversationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checkbox':
          result.checkbox = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'last_action':
          result.lastAction = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$ConversationsRecord extends ConversationsRecord {
  @override
  final DateTime createdAt;
  @override
  final BuiltList<DocumentReference<Object>> users;
  @override
  final String name;
  @override
  final bool checkbox;
  @override
  final DateTime lastAction;
  @override
  final DocumentReference<Object> reference;

  factory _$ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =>
      (new ConversationsRecordBuilder()..update(updates)).build();

  _$ConversationsRecord._(
      {this.createdAt,
      this.users,
      this.name,
      this.checkbox,
      this.lastAction,
      this.reference})
      : super._();

  @override
  ConversationsRecord rebuild(
          void Function(ConversationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationsRecordBuilder toBuilder() =>
      new ConversationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationsRecord &&
        createdAt == other.createdAt &&
        users == other.users &&
        name == other.name &&
        checkbox == other.checkbox &&
        lastAction == other.lastAction &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, createdAt.hashCode), users.hashCode),
                    name.hashCode),
                checkbox.hashCode),
            lastAction.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationsRecord')
          ..add('createdAt', createdAt)
          ..add('users', users)
          ..add('name', name)
          ..add('checkbox', checkbox)
          ..add('lastAction', lastAction)
          ..add('reference', reference))
        .toString();
  }
}

class ConversationsRecordBuilder
    implements Builder<ConversationsRecord, ConversationsRecordBuilder> {
  _$ConversationsRecord _$v;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  ListBuilder<DocumentReference<Object>> _users;
  ListBuilder<DocumentReference<Object>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object>>();
  set users(ListBuilder<DocumentReference<Object>> users) =>
      _$this._users = users;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _checkbox;
  bool get checkbox => _$this._checkbox;
  set checkbox(bool checkbox) => _$this._checkbox = checkbox;

  DateTime _lastAction;
  DateTime get lastAction => _$this._lastAction;
  set lastAction(DateTime lastAction) => _$this._lastAction = lastAction;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ConversationsRecordBuilder() {
    ConversationsRecord._initializeBuilder(this);
  }

  ConversationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _users = $v.users?.toBuilder();
      _name = $v.name;
      _checkbox = $v.checkbox;
      _lastAction = $v.lastAction;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationsRecord;
  }

  @override
  void update(void Function(ConversationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversationsRecord build() {
    _$ConversationsRecord _$result;
    try {
      _$result = _$v ??
          new _$ConversationsRecord._(
              createdAt: createdAt,
              users: _users?.build(),
              name: name,
              checkbox: checkbox,
              lastAction: lastAction,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConversationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
