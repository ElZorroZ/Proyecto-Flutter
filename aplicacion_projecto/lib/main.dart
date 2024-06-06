import 'package:aplicacion_projecto/PageGame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  TankGame game = TankGame();
  runApp(GameWidget(game:kDebugMode ? TankGame() : game));
}