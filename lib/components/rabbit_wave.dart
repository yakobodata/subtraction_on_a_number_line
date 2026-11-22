import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/foundation.dart';
import 'package:number_line/world.dart';

// A rabbit sprite component that supports dragging, rotating, tapping, and wave tracking
class WaveRabbit extends SpriteComponent
    with DragCallbacks, ScaleCallbacks, TapCallbacks {
  // True if this rabbit belongs to the initial wave; false for the second wave
  final bool isFirstWave;

  // Stores starting rotation angle when a scale/rotate gesture begins
  double _initialAngle = 0;

  // Accumulates vertical velocity over time
  double fallSpeed = 0;

  WaveRabbit({
    required super.position,
    super.anchor = Anchor.center,
    this.isFirstWave = true,
  }) : super(
          // Matches the 200x100 rabbit dimensions used in the game
          size: Vector2(200, 100),
        );

  @override
  Future<void> onLoad() async {
    // Load the rabbit sprite asset from assets/images/rabbit.png
    sprite = await Sprite.load('spongebob.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    // Move the rabbit by the drag delta
    position += event.localDelta;
    if (kDebugMode) {
      print('Dragging: ${event.localDelta}');
    }
  }

  @override
  void onScaleStart(ScaleStartEvent event) {
    super.onScaleStart(event);
    // Capture current angle before applying rotation changes
    _initialAngle = angle;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    // Apply gesture rotation relative to initial angle
    angle = _initialAngle + event.rotation;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Increase speed and move the rabbit upward each frame
    fallSpeed += 50 * dt;
    position.y -= fallSpeed * dt;

    // Remove the rabbit automatically once it exits past the top boundary
    if (position.y < -600) {
      removeFromParent();
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    final currentParent = parent;
    // Notify MyWorld so it can update the removed counter and number line
    if (currentParent is MyWorld) {
      currentParent.handleRabbitRemoved(this);
    } else {
      removeFromParent();
    }
    if (kDebugMode) {
      print('Removed Rabbit at: ${event.localPosition}');
    }
  }
}