import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:number_line/flamegame.dart';
import 'package:number_line/overlays/game_overlays.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(GameWidget(game: MyGame(),overlayBuilderMap: gameOverlays));
  
}
