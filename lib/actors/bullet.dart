import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class BulletComponent extends SpriteAnimationComponent
    with HasGameRef<PixelAdventure>{
  
  BulletComponent({super.position});

  static const BULLET_SPEED= 100;

  @override
  Future<void>onLoad()async{
    anchor= Anchor.center;
    position= game.size/2;
    size=Vector2(200,170);
    animation=await game.loadSpriteAnimation(
      'bullet.png',
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 0.1, 
        textureSize: Vector2.all(450)
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