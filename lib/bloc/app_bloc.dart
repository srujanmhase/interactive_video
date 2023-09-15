import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_video/data/data.dart';
import 'package:interactive_video/models/entity/entity.dart';
import 'package:interactive_video/models/session/session.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this.dataRepository)
      : super(
          const AppState(
            currentPosition: 0,
            showChoices: false,
            currentIndex: 0,
            currentVideoSeek: 0,
            breakpoints: [],
            restartChapter: false,
          ),
        ) {
    on<InitializeSession>(
      (event, emit) {
        //Load Data

        return emit(
          state.copyWith(
            currentPosition: 0,
            session: dataRepository.fetchCreateSession(),
            showChoices: false,
          ),
        );
      },
    );

    on<RuntimeBroker>((event, emit) {
      final currentVideoSeek = event.position;

      //Check if video complete and play the next one
      final currentEntities = List.of(state.session?.entities ?? <Entity>[]);

      double totaltime = currentVideoSeek +
          (state.currentIndex == 0
              ? 0
              : state.breakpoints[state.currentIndex - 1]);

      return emit(state.copyWith(
        currentPosition: totaltime,
        showChoices:
            currentVideoSeek == currentEntities[state.currentIndex].duration,
        currentVideoSeek: currentVideoSeek,
      ));
    });

    on<RestartSession>((event, emit) {
      return emit(
        state.copyWith(
          currentPosition: 0,
          showChoices: false,
          currentIndex: 0,
          currentVideoSeek: 0,
          breakpoints: [],
          restartChapter: false,
          session: dataRepository.fetchCreateSession(),
        ),
      );
    });

    on<RestartChapter>((event, emit) {
      return emit(state.copyWith(restartChapter: event.val));
    });

    on<GoPreviousChapter>((event, emit) {
      final currentEntities = List.of(state.session?.entities ?? <Entity>[]);
      currentEntities.removeLast();

      double duration = 0;

      for (int i = 0; i < currentEntities.length; i++) {
        duration += currentEntities[i].duration;
      }

      if (currentEntities.last.choices?.isNotEmpty ?? false) {
        duration += min(currentEntities.last.choices?.first.duration ?? 0,
            currentEntities.last.choices?.last.duration ?? 0);
      }

      return emit(
        state.copyWith(
          session: state.session?.copyWith(
            entities: currentEntities,
            duration: duration,
          ),
          currentIndex: state.currentIndex > 0
              ? state.currentIndex - 1
              : state.currentIndex,
        ),
      );
    });

    on<ChoiceSelection>((event, emit) {
      //Append selection to the session entity list

      final pos = state.currentPosition;
      final currentEntities = List.of(state.session?.entities ?? <Entity>[]);

      /*
        pos = 13
        entities is 1 with duration 15, then selection
        add the selected entity on top of the list

        pos = 13
        entities is 2 with duration 15 each, then selection
        replace all entities after current video with selection

        entity index multiplied by duration gives active entity


        [0+1 * 15 -> 15, 1+1 * 15 -> 30, 2+1 * 15 -> 45]
        13 -> 0; remove everything after this index if there is anything to remove & add the selection
        18 -> 1; 
      */

      var breakpoints = <double>[];

      for (int i = 0; i < currentEntities.length; i++) {
        if (i == 0) {
          breakpoints.add(currentEntities[i].duration);
        } else {
          breakpoints.add(
            currentEntities[i - 1].duration + currentEntities[i].duration,
          );
        }
      }

      int currentIndex = 0;

      for (int i = 0; i < breakpoints.length; i++) {
        if (pos <= breakpoints[i]) {
          currentIndex = i;
          break;
        }
      }

      currentEntities.add(event.entity);

      double duration = 0;

      for (int i = 0; i < currentEntities.length; i++) {
        duration += currentEntities[i].duration;
      }

      if (currentEntities.last.choices?.isNotEmpty ?? false) {
        duration += min(currentEntities.last.choices?.first.duration ?? 0,
            currentEntities.last.choices?.last.duration ?? 0);
      }

      return emit(
        state.copyWith(
          showChoices: false,
          currentVideoSeek: 0,
          currentIndex: currentIndex + 1,
          breakpoints: breakpoints,
          session: state.session?.copyWith(
            duration: duration > (state.session?.duration ?? 0)
                ? duration
                : (state.session?.duration ?? 0),
            entities: List.of(currentEntities),
          ),
        ),
      );
    });
  }
  Data dataRepository;
}
