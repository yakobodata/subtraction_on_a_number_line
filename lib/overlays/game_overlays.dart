import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:number_line/flamegame.dart';

Map<String, OverlayWidgetBuilder<MyGame>> gameOverlays = {

'Heading': (BuildContext context, MyGame game) {
      return Stack(
        children: [
          Positioned(
  top: 20,
  left: 16,
  right: 16,
  child: IgnorePointer(
    child: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.amber, width: 1.5),
        ),
        child: const Text(
          'Subtraction on a Number Line',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    ),
  ),
)
        ],
      );
  },

'TopLeftLogo': (BuildContext context, MyGame game) {
    return Stack(
      children: [
        Positioned(
          top: 10.0,
          left: 20.0,
          child: Image.asset(
            'assets/images/twinkles_logo.png', // Path to your image in pubspec.yaml
            width: 300.0,                  // Set the width you want
            height: 1000.0,                  // Set the height you want
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
            width: 300.0,                  // Set the width you want
            height: 1000.0,                // Set the height you want
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  },
};