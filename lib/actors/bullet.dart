import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class BulletComponent extends SpriteAnimationComponent
    with HasGameRef<PixelAdventure>{
  
  BulletComponent({super.position});

  static const BULLET_SPEED= 400;

  @override
  Future<void>onLoad()async{
    anchor= Anchor.center;
    position= position;
    size=Vector2(300,170);
    animation=await game.loadSpriteAnimation(
      'animaciones_tanque/bullet.png',
      SpriteAnimationData.sequenced(
        amount: 1,  
        stepTime: 0.1, 
        textureSize: Vector2.all(20)
        ),
    );
  }

  @override
  void update(double dt){
    super.update(dt);
    position.x+=BULLET_SPEED*dt;

    if(position.x+size.x<0){
      removeFromParent();
    }
  }
}