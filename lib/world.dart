// import 'package:flame/components.dart';
// import 'package:number_line/components/number_line.dart';
// import 'package:number_line/components/rabbit_first_wave.dart';
// import 'package:number_line/constants.dart';

// class MyWorld extends World {
//   late final NumberLine numberLine;
//   int removedCount = 0;

//   @override
//   Future<void> onLoad() async {
//     numberLine = NumberLine(
//       range: 10,
//       position: Vector2(screen_width - screen_width, screen_height - 300),
//     );

//     add(Rabbit_first_wave());
//     add(RabbitTwo_first_wave());
//     add(RabbitThree_first_wave());
//     add(RabbitFour_first_wave());
//     add(numberLine);
//   }

//   void handleRabbitRemoved(Component rabbit) {
//     rabbit.removeFromParent();
//     removedCount++;
//     numberLine.updateValue(removedCount);
//   }
// }

// import 'package:flame/components.dart';
// import 'package:number_line/components/continue_button.dart';
// import 'package:number_line/components/number_line.dart';
// import 'package:number_line/components/rabbit_wave.dart';
// import 'package:number_line/constants.dart';

// class MyWorld extends World {
//   late final NumberLine numberLine;

//   // Total number of rabbits removed via tap
//   int removedCount = 0;

//   // Flags to track wave progression so each wave only spawns once
//   bool _wave1Spawned = false;
//   bool _wave2Spawned = false;

//   // Holds the active Continue button when wave 1 is finished
//   ContinueButton? _continueButton;

//   @override
//   Future<void> onLoad() async {
//     // Create and position the number line component
//     numberLine = NumberLine(
//       range: 10,
//       position: Vector2(screen_width - screen_width, screen_height - 300),
//     );

//     add(numberLine);

//     // Spawn the initial set of rabbits when the world loads
//     _spawnFirstWaveRabbits();
//   }

//   // Adds the first wave of rabbits to the world
//   void _spawnFirstWaveRabbits() {
//     _wave1Spawned = true;
//     addAll([
//       WaveRabbit(
//         position: Vector2(screen_width - screen_width, screen_height),
//         anchor: Anchor.center,
//         isFirstWave: true,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 500, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: true,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 400, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: true,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 300, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: true,
//       ),
//     ]);
//   }

//   // Adds the second wave of rabbits after Continue is tapped
//   void _spawnSecondWaveRabbits() {
//     _wave2Spawned = true;
//     addAll([
//       WaveRabbit(
//         position: Vector2(screen_width - screen_width, screen_height),
//         anchor: Anchor.center,
//         isFirstWave: false,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 500, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: false,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 400, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: false,
//       ),
//       WaveRabbit(
//         position: Vector2(screen_width - 300, screen_height),
//         anchor: Anchor.centerRight,
//         isFirstWave: false,
//       ),
//     ]);
//   }

//   // Displays the Continue button near the bottom of the world
//   void _showContinueButton() {
//     if (_continueButton != null) return;

//     _continueButton = ContinueButton(
//       position: Vector2(0, screen_height - 20),
//       onPressed: () {
//         // Remove the button and spawn the next set of rabbits
//         _continueButton?.removeFromParent();
//         _continueButton = null;
//         _spawnSecondWaveRabbits();
//       },
//     );

//     add(_continueButton!);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     // Once wave 1 has spawned and wave 2 hasn't started yet, check if any wave 1 rabbits remain
//     if (_wave1Spawned && !_wave2Spawned && _continueButton == null) {
//       final hasFirstWaveRabbits = children
//           .whereType<WaveRabbit>()
//           .any((rabbit) => rabbit.isFirstWave);

//       // Show Continue button after all first-wave rabbits leave or are removed
//       if (!hasFirstWaveRabbits) {
//         _showContinueButton();
//       }
//     }
//   }

//   // Removes a tapped rabbit, increments the count, and updates the number line
//   void handleRabbitRemoved(Component rabbit) {
//     rabbit.removeFromParent();
//     removedCount++;
//     numberLine.updateValue(removedCount);
//   }
// }


//Third Try
import 'package:flame/components.dart';
import 'package:number_line/components/continue_button.dart';
import 'package:number_line/components/number_line.dart';
import 'package:number_line/components/rabbit_wave.dart';
import 'package:number_line/constants.dart';

class MyWorld extends World {
  late final NumberLine numberLine;

  // Separate removal counts for Wave 1 (positive) and Wave 2 (negative)
  int wave1RemovedCount = 0;
  int wave2RemovedCount = 0;

  bool _wave1Spawned = false;
  bool _wave2Spawned = false;
  ContinueButton? _continueButton;

  @override
  Future<void> onLoad() async {
    numberLine = NumberLine(
      range: 10,
      position: Vector2(screen_width - screen_width, screen_height - 300), // Top-left area offset[cite: 9, 13]
    );

    add(numberLine);
    _spawnFirstWaveRabbits();
  }

  void _spawnFirstWaveRabbits() {
    _wave1Spawned = true;
    addAll([
      WaveRabbit(
        position: Vector2(screen_width - screen_width, screen_height), // First wave rabbit position[cite: 9]
        anchor: Anchor.center,
        isFirstWave: true,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 500, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: true,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 400, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: true,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 300, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: true,
      ),
    ]);
  }

  void _spawnSecondWaveRabbits() {
    _wave2Spawned = true;
    addAll([
      WaveRabbit(
        position: Vector2(screen_width - screen_width, screen_height), // Second wave rabbit position[cite: 9]
        anchor: Anchor.center,
        isFirstWave: false,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 500, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: false,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 400, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: false,
      ),
      WaveRabbit(
        position: Vector2(screen_width - 300, screen_height),
        anchor: Anchor.centerRight,
        isFirstWave: false,
      ),
    ]);
  }

  void _showContinueButton() {
    if (_continueButton != null) return;

    _continueButton = ContinueButton(
      position: Vector2(0, screen_height - 20), // Bottom area placement[cite: 9]
      onPressed: () {
        _continueButton?.removeFromParent();
        _continueButton = null;
        _spawnSecondWaveRabbits();
      },
    );

    add(_continueButton!);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_wave1Spawned && !_wave2Spawned && _continueButton == null) {
      final hasFirstWaveRabbits = children
          .whereType<WaveRabbit>()
          .any((rabbit) => rabbit.isFirstWave);

      if (!hasFirstWaveRabbits) {
        _showContinueButton();
      }
    }
  }

  // Updates Wave 1 (+ direction) or Wave 2 (- direction from Wave 1 end) when tapped
  void handleRabbitRemoved(WaveRabbit rabbit) {
    rabbit.removeFromParent();

    if (rabbit.isFirstWave) {
      wave1RemovedCount++;
      numberLine.updateValue(wave1RemovedCount);
      numberLine.updateWave2Value(wave2RemovedCount);
    } else {
      wave2RemovedCount++;
      numberLine.updateWave2Value(wave2RemovedCount);
    }
  }
}