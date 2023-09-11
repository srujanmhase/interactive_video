part of 'app_bloc.dart';

class AppEvent {
  const AppEvent();
}

class RestartSession extends AppEvent {}

class RestartChapter extends AppEvent {
  const RestartChapter({required this.val});
  final bool val;
}

class GoPreviousChapter extends AppEvent {}

class RuntimeBroker extends AppEvent {
  const RuntimeBroker({required this.position});

  final double position;
}

class InitializeSession extends AppEvent {}

class ChoiceSelection extends AppEvent {
  const ChoiceSelection({required this.entity});
  final Entity entity;
}
