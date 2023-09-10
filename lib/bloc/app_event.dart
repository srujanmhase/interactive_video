part of 'app_bloc.dart';

class AppEvent {
  const AppEvent();
}

class SeekerControl extends AppEvent {
  const SeekerControl({required this.position});

  final double position;
}

class RuntimeBroker extends AppEvent {
  const RuntimeBroker({required this.position});

  final double position;
}

class InitializeSession extends AppEvent {}

class ChoiceSelection extends AppEvent {
  const ChoiceSelection({required this.entity});
  final Entity entity;
}
