import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState {idle, running}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure> {

  String character;
  Player({position,required this.character}) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double StepTime = 0.06;


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation(){
    idleAnimation = _spriteAnimation("idle",1);

    runningAnimation = _spriteAnimation("move",10);
    
  
  animations = {
    PlayerState.idle: idleAnimation,
    PlayerState.running: runningAnimation,
  };
  current= PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount){
    return SpriteAnimation.fromFrameData(game.images.fromCache("animaciones_tanque/$character/$state.png"), 
    SpriteAnimationData.sequenced(
      amount: amount, 
      stepTime: StepTime,
      textureSize: Vector2.all(32)
    ));
  }
}