import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

// A tappable button component drawn on the Flame canvas
class ContinueButton extends PositionComponent with TapCallbacks {
  // Callback executed when the user taps the button
  final VoidCallback onPressed;

  ContinueButton({
    required this.onPressed,
    required super.position,
  }) : super(
          size: Vector2(160, 48),
          anchor: Anchor.bottomCenter,
        );

  @override
  void render(Canvas canvas) {
    // Define a rounded rectangle covering the button's bounds
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size.toSize(),
      const Radius.circular(10),
    );

    // Fill button background with amber
    canvas.drawRRect(
      rect,
      Paint()..color = Colors.amber,
    );

    // Draw a crisp white border around the button
    canvas.drawRRect(
      rect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // Configure label text style
    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    // Draw centered "Continue" label inside the button
    textPaint.render(
      canvas,
      'Continue',
      Vector2(size.x / 2 - 36, size.y / 2 - 11),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Trigger the action passed in from MyWorld
    onPressed();
  }
}