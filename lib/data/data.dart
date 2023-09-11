import 'package:interactive_video/models/entity/entity.dart';
import 'package:interactive_video/models/session/session.dart';
import 'package:interactive_video/utils/utils.dart';

class Data {
  Session fetchCreateSession() {
    final a = Entity(
      uuid: AppUtils.getRandomString(12),
      title: 'Joyrides',
      mediaLink:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
      duration: 15,
    );
    final b = Entity(
      uuid: AppUtils.getRandomString(12),
      title: 'Meltdowns',
      mediaLink:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
      duration: 15,
    );
    final c = Entity(
      uuid: AppUtils.getRandomString(12),
      title: 'Fun',
      mediaLink:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      duration: 60,
    );
    final d = Entity(
      uuid: AppUtils.getRandomString(12),
      title: 'Escapes',
      mediaLink:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      duration: 15,
    );
    return Session(duration: 45, entities: [
      a.copyWith(choices: [
        b.copyWith(choices: [c, d]),
        c.copyWith(choices: [b, d]),
      ])
    ]);
  }
}
