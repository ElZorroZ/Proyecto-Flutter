import 'dart:async';
import 'package:pixel_adventure/actors/bullet.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';
import 'package:pixel_adventure/pixel_adventure.dart';
import 'dart:math' as math;

enum PlayerState {idle, running}

enum PlayerDirection {move, none}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure> with HasDraggables{

  String character;
  Player({position,required this.character}) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  late final JoystickComponent joystick;
  final double StepTime = 0.06;

  PlayerDirection playerDirection = PlayerDirection.move;
  double moveSpeed=100;
  Vector2 velocity= Vector2.zero();


  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();

    /*final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: knobPaint),
      background: CircleComponent(radius: 100, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);*/
  }

  @override
  Future<void> onLoad() async{
    await super.onLoad();
  }


@override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  void _updatePlayerMovement(double dt){
    /*position.add(joystick.relativeDelta * 300 * dt);*/
    double dirx=0.0;
    double diry=0.0;
    switch(playerDirection){
      case PlayerDirection.none:
        position+=velocity * dt;
        break;
      case PlayerDirection.move:
        dirx+=moveSpeed;
        velocity = Vector2(dirx, diry);
        position+=velocity * dt;
        shoot(dirx, diry,position);
        break;
      default:
    }
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
  void shoot(double dirx, diry,position){
    game.add(
      BulletComponent(
        position: position,
      ),
    );
  }
}