// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flame/game.dart';

// Project imports:
import 'ember_quest.dart';

void main() {
  runApp(
    const GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
    ),
  );
}
