// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  double get currentPosition => throw _privateConstructorUsedError;
  bool get showChoices => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  double get currentVideoSeek => throw _privateConstructorUsedError;
  List<double> get breakpoints => throw _privateConstructorUsedError;
  bool get restartChapter => throw _privateConstructorUsedError;
  Session? get session => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {double currentPosition,
      bool showChoices,
      int currentIndex,
      double currentVideoSeek,
      List<double> breakpoints,
      bool restartChapter,
      Session? session});

  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = null,
    Object? showChoices = null,
    Object? currentIndex = null,
    Object? currentVideoSeek = null,
    Object? breakpoints = null,
    Object? restartChapter = null,
    Object? session = freezed,
  }) {
    return _then(_value.copyWith(
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as double,
      showChoices: null == showChoices
          ? _value.showChoices
          : showChoices // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentVideoSeek: null == currentVideoSeek
          ? _value.currentVideoSeek
          : currentVideoSeek // ignore: cast_nullable_to_non_nullable
              as double,
      breakpoints: null == breakpoints
          ? _value.breakpoints
          : breakpoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      restartChapter: null == restartChapter
          ? _value.restartChapter
          : restartChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentPosition,
      bool showChoices,
      int currentIndex,
      double currentVideoSeek,
      List<double> breakpoints,
      bool restartChapter,
      Session? session});

  @override
  $SessionCopyWith<$Res>? get session;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = null,
    Object? showChoices = null,
    Object? currentIndex = null,
    Object? currentVideoSeek = null,
    Object? breakpoints = null,
    Object? restartChapter = null,
    Object? session = freezed,
  }) {
    return _then(_$_AppState(
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as double,
      showChoices: null == showChoices
          ? _value.showChoices
          : showChoices // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentVideoSeek: null == currentVideoSeek
          ? _value.currentVideoSeek
          : currentVideoSeek // ignore: cast_nullable_to_non_nullable
              as double,
      breakpoints: null == breakpoints
          ? _value._breakpoints
          : breakpoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      restartChapter: null == restartChapter
          ? _value.restartChapter
          : restartChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {required this.currentPosition,
      required this.showChoices,
      required this.currentIndex,
      required this.currentVideoSeek,
      required final List<double> breakpoints,
      required this.restartChapter,
      this.session})
      : _breakpoints = breakpoints;

  @override
  final double currentPosition;
  @override
  final bool showChoices;
  @override
  final int currentIndex;
  @override
  final double currentVideoSeek;
  final List<double> _breakpoints;
  @override
  List<double> get breakpoints {
    if (_breakpoints is EqualUnmodifiableListView) return _breakpoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakpoints);
  }

  @override
  final bool restartChapter;
  @override
  final Session? session;

  @override
  String toString() {
    return 'AppState(currentPosition: $currentPosition, showChoices: $showChoices, currentIndex: $currentIndex, currentVideoSeek: $currentVideoSeek, breakpoints: $breakpoints, restartChapter: $restartChapter, session: $session)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.showChoices, showChoices) ||
                other.showChoices == showChoices) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.currentVideoSeek, currentVideoSeek) ||
                other.currentVideoSeek == currentVideoSeek) &&
            const DeepCollectionEquality()
                .equals(other._breakpoints, _breakpoints) &&
            (identical(other.restartChapter, restartChapter) ||
                other.restartChapter == restartChapter) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPosition,
      showChoices,
      currentIndex,
      currentVideoSeek,
      const DeepCollectionEquality().hash(_breakpoints),
      restartChapter,
      session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final double currentPosition,
      required final bool showChoices,
      required final int currentIndex,
      required final double currentVideoSeek,
      required final List<double> breakpoints,
      required final bool restartChapter,
      final Session? session}) = _$_AppState;

  @override
  double get currentPosition;
  @override
  bool get showChoices;
  @override
  int get currentIndex;
  @override
  double get currentVideoSeek;
  @override
  List<double> get breakpoints;
  @override
  bool get restartChapter;
  @override
  Session? get session;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
