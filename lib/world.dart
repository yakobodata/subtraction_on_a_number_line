import 'package:flame/components.dart';
import 'package:number_line/components/number_line.dart';
import 'package:number_line/components/rabbit.dart';
import 'package:number_line/constants.dart';

class MyWorld extends World {
  late final NumberLine numberLine;
  int removedCount = 0;

  @override
  Future<void> onLoad() async {
    numberLine = NumberLine(
      range: 10,
      position: Vector2(screen_width - screen_width, screen_height - 300),
    );

    add(Rabbit());
    add(RabbitTwo());
    add(RabbitThree());
    add(RabbitFour());
    add(numberLine);
  }

  void handleRabbitRemoved(Component rabbit) {
    rabbit.removeFromParent();
    removedCount++;
    numberLine.updateValue(removedCount);
  }
}