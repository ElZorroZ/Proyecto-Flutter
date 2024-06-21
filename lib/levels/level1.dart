import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {

  late TiledComponent level;
  
  @override
  FutureOr<void> onLoad() async{
    try{
    
      level = await TiledComponent.load("NivelPrueba2.tmx", Vector2.all(16));

      add(level);

      return super.onLoad();
    } catch (e){
      print("No funciona:$e");
    }

  }
}