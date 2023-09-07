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
      : super(const AppState(currentPosition: 0, showChoices: false)) {
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

    on<SeekerControl>((event, emit) {
      // Update seek UI
      // Check which video that would send the user to & update seek position of the then active video
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
        if (pos < breakpoints[i]) {
          currentIndex = i;
          break;
        }
      }

      currentEntities.removeRange(currentIndex + 1, currentEntities.length);

      currentEntities.add(event.entity);

      return emit(
        state.copyWith(
          showChoices: false,
          session: state.session?.copyWith(
            entities: List.of(currentEntities),
          ),
        ),
      );
    });
  }
  Data dataRepository;
}
