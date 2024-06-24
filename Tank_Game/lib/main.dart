import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter2/tank_game.dart'; // Asegúrate de que la ruta sea correcta

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  TankGame game = TankGame();
  runApp(GameWidget(game: kDebugMode ? TankGame() : game));
}
