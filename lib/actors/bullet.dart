import 'package:flame/components.dart';
import 'package:flame_work_shop/level.dart';

class BulletComponent extends SpriteAnimationComponent{
  @override
  Future<void>onLoad()async{
    anchor= Anchor.center;
    position= pixel_adventure.size/2;
    size=Vector2(200,170);
    animation=await pixel_adventure.loadSpriteAnimation(
      'bullet.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.1, 
        textureSize: Vector2.all(450)
        ),
    );
  }
}