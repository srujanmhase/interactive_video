part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required double currentPosition,
    required bool showChoices,
    required int currentIndex,
    required double currentVideoSeek,
    required List<double> breakpoints,
    required bool restartChapter,
    Session? session,
  }) = _AppState;
}
