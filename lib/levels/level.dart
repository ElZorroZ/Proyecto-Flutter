import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure/actors/player.dart';

class Level extends World {
  late TiledComponent level;
  final String levelName;
  Level({required this.levelName});

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    final spwanPointPlayer = level.tileMap.getLayer<ObjectGroup>("Spawn");
    for(final spwanPoint in spwanPointPlayer!.objects){
      switch(spwanPoint.class_){
        case "Player1":
          final player=Player(position: Vector2(spwanPoint.x,spwanPoint.y));
          add(player);
          break;
        case "Player2":
          final player=Player(position: Vector2(spwanPoint.x,spwanPoint.y));
          add(player);
          break;
        default:
      }
    }

    return super.onLoad();
  }
}
