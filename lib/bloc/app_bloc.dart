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

      // final currentEntities = List.of(state.session?.entities ?? <Entity>[]);

      var breakpoints = <double>[];

      for (int i = 0; i < currentEntities.length; i++) {
        breakpoints.add((i + 1) * currentEntities[i].duration);
      }

      double totaltime = currentVideoSeek +
          (state.currentIndex == 0 ? 0 : breakpoints[state.currentIndex - 1]);

      return emit(state.copyWith(
        currentPosition: totaltime,
        showChoices:
            currentVideoSeek == currentEntities[state.currentIndex].duration,
        currentVideoSeek: currentVideoSeek,
        session: state.session?.copyWith(
          duration: (state.session?.duration ?? 0) < breakpoints.last
              ? breakpoints.last
              : (state.session?.duration ?? 0),
        ),
      ));
    });

    on<SeekerControl>((event, emit) {
      // Update seek UI
      // Check which video that would send the user to & update seek position of the then active video

      final currentEntities = List.of(state.session?.entities ?? <Entity>[]);

      var breakpoints = <double>[];

      for (int i = 0; i < currentEntities.length; i++) {
        breakpoints.add((i + 1) * currentEntities[i].duration);
      }

      int currentIndex = 0;

      for (int i = 0; i < breakpoints.length; i++) {
        if (event.position <= breakpoints[i]) {
          currentIndex = i;
          break;
        }
      }

      final newPosition =
          event.position > breakpoints.last ? breakpoints.last : event.position;

      emit(
        state.copyWith(
          currentPosition: newPosition,
          currentIndex: currentIndex,
          currentVideoSeek: currentIndex > 0
              ? newPosition - breakpoints[currentIndex - 1]
              : newPosition,
          showChoices:
              (currentEntities[currentIndex].choices ?? <Entity>[]).isNotEmpty
                  ? (breakpoints[currentIndex] - newPosition == 5 ||
                      newPosition == breakpoints.last)
                  : false,
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
        breakpoints.add((i + 1) * currentEntities[i].duration);
      }

      int currentIndex = 0;

      for (int i = 0; i < breakpoints.length; i++) {
        if (pos <= breakpoints[i]) {
          currentIndex = i;
          break;
        }
      }

      print('breakpoints: $breakpoints, pos: $pos');

      print('length: ${currentEntities.length}, index: ${currentIndex + 1}');
      print('//');
      currentEntities.add(event.entity);

      print('length: ${currentEntities.length}, index: ${currentIndex + 1}');

      return emit(
        state.copyWith(
          showChoices: false,
          currentVideoSeek: 0,
          currentIndex: currentIndex + 1,
          session: state.session?.copyWith(
            entities: List.of(currentEntities),
          ),
        ),
      );
    });
  }
  Data dataRepository;
}
