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


import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:number_line/world.dart';

class NumberLine extends PositionComponent {
  final int range;
  int currentValue = 0;

  NumberLine({
    this.range = 5,
    super.position,
  }) : super(
          size: Vector2(500, 100),
          anchor: Anchor.center,
        );

  void updateValue(int value) {
    currentValue = value.clamp(-range, range);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final valueLinePaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final textPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

    final double midY = size.y / 2;
    final double startX = 10;
    final double endX = size.x - 10;
    final double totalWidth = endX - startX;
    final int totalSteps = range * 2;

    // Main horizontal number line
    canvas.drawLine(
      Offset(startX, midY),
      Offset(endX, midY),
      paint,
    );

    // Ticks and labels
    for (int i = -range; i <= range; i++) {
      final double x = startX + ((i + range) / totalSteps) * totalWidth;
      final double tickHeight = (i == 0) ? 14 : 10;

      canvas.drawLine(
        Offset(x, midY - tickHeight),
        Offset(x, midY + tickHeight),
        paint,
      );

      final String label = '$i';
      textPaint.render(
        canvas,
        label,
        Vector2(
          x - (label.length * 5.0),
          midY + 18,
        ),
      );
    }

    
    // Line representing removed components from 0 to currentValue, just above the number line
    if (currentValue != 0) {
      final double lineY = midY - 22;
      final double zeroX = startX + (range / totalSteps) * totalWidth;
      final double valueX =
          startX + ((currentValue + range) / totalSteps) * totalWidth;

      canvas.drawLine(
        Offset(zeroX, lineY),
        Offset(valueX, lineY),
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );
    }
  }

  
}