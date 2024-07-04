import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState {idle, running}

enum PlayerDirection {move, none}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure> {

  String character;
  Player({position,required this.character}) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double StepTime = 0.06;

  PlayerDirection playerDirection = PlayerDirection.move;
  double moveSpeed=100;
  Vector2 velocity= Vector2.zero();


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }


@override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  void _updatePlayerMovement(double dt){
    double dirx=0.0;
    switch(playerDirection){
      case PlayerDirection.none:
      dirx=0;
        break;
      case PlayerDirection.move:
      dirx+=moveSpeed;
        break;
      default:
    }
    velocity = Vector2(dirx, dirx);
    position+=velocity * dt;
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