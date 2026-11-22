// MyGame is a custom class that extends FlameGame and defines the game logic and behavior.
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:number_line/world.dart';


class MyGame extends FlameGame {
  MyGame() : super(world: MyWorld(),
  // camera: CameraComponent.withFixedResolution(width: 1000,height: 600,)
  );

  @override
  Color backgroundColor() => Colors.blueAccent;
}