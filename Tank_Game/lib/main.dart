import 'package:flutter/material.dart';
import 'package:flame/game.dart'; // Asegúrate de importar Flame
import 'package:proyecto_flutter2/tank_game.dart'; // Asegúrate de que la ruta sea correcta

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  final TankGame game = TankGame(); // Instancia de tu juego

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tank Game Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tank Game'),
        ),
        body: GameWidget(game: game), // Aquí usamos GameWidget como widget principal
      ),
    );
  }
}
