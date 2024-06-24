import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:proyecto_flutter2/levels/level1.dart'; // Asegúrate de que la ruta sea correcta

class TankGame extends FlameGame {
  late final CameraComponent cam;   
  final world = Level(); // Suponiendo que tienes una clase Level que extiende World

  @override
  Future<void> onLoad() async{
    await super.onLoad(); 
    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 1500,
      height: 1000,
    );
    addAll([cam, world]);
  }
}
