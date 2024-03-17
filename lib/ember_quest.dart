// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';

// Project imports:
import 'actors/ember.dart';
import 'actors/water_enemy.dart';
import 'managers/segment_manager.dart';
import 'objects/ground_block.dart';
import 'objects/platform_block.dart';
import 'objects/star.dart';

class EmberQuestGame extends FlameGame {
  late EmberPlayer _ember;
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();
  }

  void initializeGame() {
    // assume size of the viewport is < 3200
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _ember = EmberPlayer(position: Vector2(128, canvasSize.y - 70));
    world.add(_ember);
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case const (GroundBlock):
          add(GroundBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;

        case const (PlatformBlock):
          add(PlatformBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;

        case const (Star):
          add(Star(gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;

        case const (WaterEnemy):
          add(WaterEnemy(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;
      }
    }
  }
}
