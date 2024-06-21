import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter2/Tank_game.dart';

void main() {
  TankGame game = TankGame();
  runApp(GameWidget(game: kDebugMode ? TankGame() : game));
}

