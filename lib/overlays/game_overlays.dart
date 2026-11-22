import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:number_line/flamegame.dart';

Map<String, OverlayWidgetBuilder<MyGame>> gameOverlays = {

'TopLeftLogo': (BuildContext context, MyGame game) {
    return Stack(
      children: [
        Positioned(
          top: 10.0,
          left: 20.0,
          child: Image.asset(
            'assets/images/twinkles_logo.png', // Path to your image in pubspec.yaml
            width: 100.0,                  // Set the width you want
            height: 800.0,                  // Set the height you want
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  },
'TopRightLogo': (BuildContext context, MyGame game) {
    return Stack(
      children: [
        Positioned(
          top: 10.0,
          right: 20.0,
          child: Image.asset(
            'assets/images/vativa_logo.png', // Path to your image in pubspec.yaml
            width: 100.0,                  // Set the width you want
            height: 800.0,                  // Set the height you want
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  },
};