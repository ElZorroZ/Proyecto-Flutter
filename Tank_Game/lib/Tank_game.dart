import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:proyecto_flutter2/levels/level1.dart'; // Asegúrate de que la ruta sea correcta

class TankGame extends FlameGame {
  late final CameraComponent cam;   
  final world = Level(); // Suponiendo que tienes una clase Level que extiende World

  @override
  Future<void> onLoad() async {
    await super.onLoad(); // Asegúrate de llamar a super.onLoad() antes de añadir componentes
    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 360,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
  }
}
