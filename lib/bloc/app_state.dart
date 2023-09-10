part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required double currentPosition,
    required bool showChoices,
    required int currentIndex,
    required double currentVideoSeek,
    Session? session,
  }) = _AppState;
}
