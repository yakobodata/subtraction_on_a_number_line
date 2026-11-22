// import 'package:flame/components.dart'; // Flame components (PositionComponent, etc.)
// import 'package:flutter/material.dart'; // Flutter drawing tools (Canvas, Paint, Colors)

// class NumberLine extends PositionComponent {
//   // How far the number line goes left/right from zero
//   // Example: range = 5 means -5 ... 0 ... +5
//   final int range;
//   int currentValue = 0;

//   NumberLine({
//     this.range = 5, // Default range is 5 if you don't pass one
//     super.position, // Position on the screen (x, y)
//   }) : super(
//           size: Vector2(500, 100), // Width = 500, height = 80
//           anchor: Anchor.center, // Position is measured from the center of this component
//         );

  
//   void updateValue(int value) {
//     currentValue = value.clamp(-range, range);
//   }

//   @override
//   void render(Canvas canvas) {
//     // Paint used to draw the line and ticks
//     final paint = Paint()
//       ..color = Colors.white // Line color
//       ..strokeWidth = 3 // Line thickness
//       ..style = PaintingStyle.stroke; // Draw outline only (not filled shapes)

//     // Paint used to draw the numbers
//     final textPaint = TextPaint(
//       style: const TextStyle(
//         color: Colors.white, // Number color
//         fontSize: 12, // Number size
//         fontWeight: FontWeight.bold, // Make numbers bold
//       ),
//     );

//     final double midY = size.y / 2; // Vertical center of the component
//     final double startX = 10; // Left end of the line (padding from edge)
//     final double endX = size.x - 10; // Right end of the line (padding from edge)
//     final double totalWidth = endX - startX; // Full drawable width of the line
//     final int totalSteps = range * 2; // Number of steps from -range to +range

//     // Draw the straight main horizontal line
//     canvas.drawLine(
//       Offset(startX, midY), // Starting point (left)
//       Offset(endX, midY), // Ending point (right)
//       paint, // Use the white stroke paint
//     );

//     // Loop through every value from -range to +range
//     for (int i = -range; i <= range; i++) {
//       // Convert number value (i) into an X position on the line
//       final double x = startX + ((i + range) / totalSteps) * totalWidth;

//       // Zero gets a slightly taller tick so it stands out
//       final double tickHeight = (i == 0) ? 14 : 10;

//       // Draw the vertical tick mark
//       canvas.drawLine(
//         Offset(x, midY - tickHeight), // Top of the tick
//         Offset(x, midY + tickHeight), // Bottom of the tick
//         paint,
//       );

//       // Text to show under the tick (e.g. "-3", "0", "2")
//       final String label = '$i';

//       // Draw the number under the tick
//       textPaint.render(
//         canvas, // Where to draw
//         label, // The text
//         Vector2(
//           x - (label.length * 5.0), // Shift left a bit so text looks centered
//           midY + 18, // Place text below the line
//         ),
//       );
//     }

      
//   }
// }


// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:number_line/world.dart';

// class NumberLine extends PositionComponent {
//   final int range;
//   int currentValue = 0;

//   NumberLine({
//     this.range = 5,
//     super.position,
//   }) : super(
//           size: Vector2(500, 100),
//           anchor: Anchor.center,
//         );

//   void updateValue(int value) {
//     currentValue = value.clamp(-range, range);
//   }

//   @override
//   void render(Canvas canvas) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     final valueLinePaint = Paint()
//       ..color = Colors.amber
//       ..strokeWidth = 6
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke;

//     final textPaint = TextPaint(
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 12,
//         fontWeight: FontWeight.bold,
//       ),
//     );

//     final double midY = size.y / 2;
//     final double startX = 10;
//     final double endX = size.x - 10;
//     final double totalWidth = endX - startX;
//     final int totalSteps = range * 2;

//     // Main horizontal number line
//     canvas.drawLine(Offset(startX, midY),Offset(endX, midY),paint,);

//     // Ticks and labels
//     for (int i = -range; i <= range; i++) {
//       final double x = startX + ((i + range) / totalSteps) * totalWidth;
//       final double tickHeight = (i == 0) ? 14 : 10;

//       canvas.drawLine(
//         Offset(x, midY - tickHeight),
//         Offset(x, midY + tickHeight),
//         paint,
//       );

//       final String label = '$i';
//       textPaint.render(
//         canvas,
//         label,
//         Vector2(
//           x - (label.length * 5.0),
//           midY + 18,
//         ),
//       );
//     }

    
//     // Line representing removed components from 0 to currentValue, just above the number line
//     if (currentValue != 0) {
//       final double lineY = midY - 22;
//       final double zeroX = startX + (range / totalSteps) * totalWidth;
//       final double valueX =
//           startX + ((currentValue + range) / totalSteps) * totalWidth;

//       canvas.drawLine(
//         Offset(zeroX, lineY),
//         Offset(valueX, lineY),
//         Paint()
//           ..color = Colors.yellow
//           ..strokeWidth = 5
//           ..strokeCap = StrokeCap.round
//           ..style = PaintingStyle.stroke,
//       );
//     }
//   }

  
// }


//Third Try
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NumberLine extends PositionComponent {
  final int range; // Half-range of the number line (e.g., 10 means -10 to +10)
  int currentValue = 0; // Wave 1 removed count (moves in + direction from 0)
  int wave2Value = 0; // Wave 2 removed count (moves in - direction from currentValue)[cite: 7]

  NumberLine({
    this.range = 5, // Default range if none is provided[cite: 7]
    super.position, // Position in the game world[cite: 7]
  }) : super(
          size: Vector2(500, 100), // Component width and height[cite: 7]
          anchor: Anchor.center, // Center-anchored position[cite: 7]
        );

  // Updates the first wave's line endpoint value[cite: 7]
  void updateValue(int value) {
    currentValue = value.clamp(-range, range); // Keep within [-range, range][cite: 7]
  }

  // Updates how far the second wave's line moves in the negative direction,
  // allowing it to pass 0 into negative values up to -range[cite: 7]
  void updateWave2Value(int value) {
    // Allow wave2Value to push (currentValue - wave2Value) all the way down to -range[cite: 7]
    final maxNegativeSteps = (currentValue + range).clamp(0, range * 2); // Max steps left before -range[cite: 7]
    wave2Value = value.clamp(0, maxNegativeSteps); // Clamp non-negative step count[cite: 7]
  }

  @override
  void render(Canvas canvas) {
    // Base white paint for the main axis and tick marks[cite: 7]
    final paint = Paint()
      ..color = Colors.white // Axis and tick color[cite: 7]
      ..strokeWidth = 3 // Line thickness[cite: 7]
      ..style = PaintingStyle.stroke; // Stroke-only rendering[cite: 7]

    // Yellow line paint for Wave 1 (positive direction from 0)[cite: 7]
    final wave1LinePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Cyan line paint for Wave 2 (negative direction from Wave 1's end)[cite: 7]
    final wave2LinePaint = Paint()
      ..color = Colors.cyanAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Text style for number labels beneath each tick[cite: 7]
    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white, // Label text color[cite: 7]
        fontSize: 12, // Label font size[cite: 7]
        fontWeight: FontWeight.bold, // Bold labels[cite: 7]
      ),
    );

    final double midY = size.y / 2; // Vertical center of the component[cite: 7]
    final double startX = 2; // Left padding edge[cite: 7]
    final double endX = size.x - 2; // Right padding edge[cite: 7]
    final double totalWidth = endX - startX; // Usable horizontal span[cite: 7]
    final int totalSteps = range * 2; // Total steps across the number line[cite: 7]

    // Converts a numeric value on the number line into a local X coordinate[cite: 7]
    double valueToX(num val) =>
        startX + ((val + range) / totalSteps) * totalWidth; // Map value to X[cite: 7]

    // 1. Draw the main horizontal number line[cite: 7]
    canvas.drawLine(
      Offset(startX, midY), // Left end[cite: 7]
      Offset(endX, midY), // Right end[cite: 7]
      paint, // Base line style[cite: 7]
    );

    // 2. Draw tick marks and labels for every integer in [-range, +range][cite: 7]
    for (int i = -range; i <= range; i++) {
      final double x = valueToX(i); // X position for tick i[cite: 7]
      final double tickHeight = (i == 0) ? 14 : 10; // Taller tick at 0[cite: 7]

      canvas.drawLine(
        Offset(x, midY - tickHeight), // Top of tick[cite: 7]
        Offset(x, midY + tickHeight), // Bottom of tick[cite: 7]
        paint, // Tick style[cite: 7]
      );

      final String label = '$i'; // Numeric label text[cite: 7]
      textPaint.render(
        canvas, // Target canvas[cite: 7]
        label, // Text to draw[cite: 7]
        Vector2(
          x - (label.length * 5.0), // Approximate horizontal centering[cite: 7]
          midY + 18, // Position below tick mark[cite: 7]
        ),
      );
    }

    // 3. Wave 1 line: starts at 0 and moves right (+) to currentValue[cite: 7]
    final double wave1Y = midY - 22; // Just above the tallest tick mark[cite: 7]
    final double wave1StartX = valueToX(0); // Start at 0[cite: 7]
    final double wave1EndX = valueToX(currentValue); // End at Wave 1 count[cite: 7]

    if (currentValue != 0) {
      canvas.drawLine(
        Offset(wave1StartX, wave1Y),
        Offset(wave1EndX, wave1Y),
        wave1LinePaint,
      );
    }

    // 4. Wave 2 line: above Wave 1's line, starting at wave1EndX and moving left (-)
    //    past 0 into negative numbers when wave2Value > currentValue[cite: 7]
    if (wave2Value != 0) {
      final double wave2Y = midY - 36; // Stacked above the Wave 1 line[cite: 7]
      final double wave2StartX = wave1EndX; // Starts where Wave 1 ended[cite: 7]
      final int netValue = (currentValue - wave2Value).clamp(-range, range); // Net position[cite: 7]
      final double wave2EndX = valueToX(netValue); // Moves left across 0 into negatives[cite: 7]

      canvas.drawLine(
        Offset(wave2StartX, wave2Y),
        Offset(wave2EndX, wave2Y),
        wave2LinePaint,
      );
    }
  }
}