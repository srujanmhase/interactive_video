import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';

@Freezed()
class Entity with _$Entity {
  const factory Entity({
    required String uuid,
    required String title,
    required String mediaLink,
    required double duration,
    List<Entity>? choices,
  }) = _Entity;

  factory Entity.insertChildren(Entity oldEntity, List<Entity> children) {
    return oldEntity.copyWith(choices: children);
  }
}
