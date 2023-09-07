import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_video/models/entity/entity.dart';

part 'session.freezed.dart';

@Freezed()
class Session with _$Session {
  const factory Session({
    required double duration,
    required List<Entity> entities,
  }) = _Session;
}
