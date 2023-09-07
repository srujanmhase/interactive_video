// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Entity {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get mediaLink => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  List<Entity>? get choices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntityCopyWith<Entity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res, Entity>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      String mediaLink,
      double duration,
      List<Entity>? choices});
}

/// @nodoc
class _$EntityCopyWithImpl<$Res, $Val extends Entity>
    implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? mediaLink = null,
    Object? duration = null,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: null == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntityCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory _$$_EntityCopyWith(_$_Entity value, $Res Function(_$_Entity) then) =
      __$$_EntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      String mediaLink,
      double duration,
      List<Entity>? choices});
}

/// @nodoc
class __$$_EntityCopyWithImpl<$Res>
    extends _$EntityCopyWithImpl<$Res, _$_Entity>
    implements _$$_EntityCopyWith<$Res> {
  __$$_EntityCopyWithImpl(_$_Entity _value, $Res Function(_$_Entity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? mediaLink = null,
    Object? duration = null,
    Object? choices = freezed,
  }) {
    return _then(_$_Entity(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaLink: null == mediaLink
          ? _value.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
    ));
  }
}

/// @nodoc

class _$_Entity implements _Entity {
  const _$_Entity(
      {required this.uuid,
      required this.title,
      required this.mediaLink,
      required this.duration,
      final List<Entity>? choices})
      : _choices = choices;

  @override
  final String uuid;
  @override
  final String title;
  @override
  final String mediaLink;
  @override
  final double duration;
  final List<Entity>? _choices;
  @override
  List<Entity>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Entity(uuid: $uuid, title: $title, mediaLink: $mediaLink, duration: $duration, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entity &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, title, mediaLink, duration,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      __$$_EntityCopyWithImpl<_$_Entity>(this, _$identity);
}

abstract class _Entity implements Entity {
  const factory _Entity(
      {required final String uuid,
      required final String title,
      required final String mediaLink,
      required final double duration,
      final List<Entity>? choices}) = _$_Entity;

  @override
  String get uuid;
  @override
  String get title;
  @override
  String get mediaLink;
  @override
  double get duration;
  @override
  List<Entity>? get choices;
  @override
  @JsonKey(ignore: true)
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      throw _privateConstructorUsedError;
}
