part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required double currentPosition,
    required bool showChoices,
    Session? session,
  }) = _AppState;
}
