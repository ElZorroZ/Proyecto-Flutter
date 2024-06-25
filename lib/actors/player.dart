import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState {idle, running}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idleAnimation;
  final double StepTime = 0.05;


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation(){
    idleAnimation = SpriteAnimation.fromFrameData(game.images.fromCache("animaciones_tanque/move.png"), 
    SpriteAnimationData.sequenced(
      amount: 2, 
      stepTime: StepTime,
      textureSize: Vector2.all(32)
    ));
  
  animations = {
    PlayerState.idle: idleAnimation 
  };
  current= PlayerState.idle;
  }
}