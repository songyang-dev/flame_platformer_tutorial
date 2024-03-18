// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flame/game.dart';

// Project imports:
import 'ember_quest.dart';
import 'overlays/game_over.dart';
import 'overlays/main_menu.dart';

void main() {
  runApp(
    GameWidget<EmberQuestGame>.controlled(
      gameFactory: EmberQuestGame.new,
      overlayBuilderMap: {
        'MainMenu': (_, game) => MainMenu(game: game),
        'GameOver': (_, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['MainMenu'],
    ),
  );
}
