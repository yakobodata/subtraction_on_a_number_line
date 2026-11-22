import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/foundation.dart';
import 'package:number_line/constants.dart';
import 'package:number_line/world.dart';


/// A component that renders the crate sprite, with a 16 x 16 size.
/// if we are using the Spritecomponenet class then we are already using 
/// FlameGame class because the SpriteComponent class is a subclass of 
/// Component class which is a subclass of FlameGame class. So we don't need to use the FlameGame class again.
class Rabbit extends SpriteComponent with DragCallbacks,ScaleCallbacks,TapCallbacks {
  //no constructor parameters are needed because we are using the default constructor of the SpriteComponent class
  // which is a subclass of Component class which is a subclass of FlameGame class.
  // we have an initializer list that sets the size of the crate to 300 x 300 pixels using the Vector2 class.
  Rabbit() : super(size: Vector2(200,100), anchor: Anchor.center, 
  position: Vector2(screen_width-screen_width, screen_height));

  double _initialAngle = 0;
  double fallSpeed = 0;
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('rabbit.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
     // Do something in response to a drag event
       position += event.localDelta;
      if (kDebugMode) {
        print('Dragging: ${event.localDelta}');
      } // Quick check to confirm it fires
     }

  @override
  void onScaleStart(ScaleStartEvent event) {
    super.onScaleStart(event);
    _initialAngle = angle;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    angle = _initialAngle + event.rotation;
  }

  @override
  void update(double dt) {
    super.update(dt);
      // Falling with gravity
      fallSpeed += 100 * dt;
      position.y -= fallSpeed * dt;
      if (kDebugMode) {
        print('position.y: ${position.y}');
      } // Debugging line to check the position of the rabbit  
      }
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Do something in response to a tap event
    final currentParent = parent;
    if (currentParent is MyWorld) {
      currentParent.handleRabbitRemoved(this);
    } else {
      removeFromParent();
    }
    if (kDebugMode) {
      print('Removed Rabbit at: ${event.localPosition}');
    } // Quick check to confirm it fires
  }

}

class RabbitTwo extends SpriteComponent with DragCallbacks,ScaleCallbacks,TapCallbacks {
  //no constructor parameters are needed because we are using the default constructor of the SpriteComponent class
  // which is a subclass of Component class which is a subclass of FlameGame class.
  // we have an initializer list that sets the size of the crate to 300 x 300 pixels using the Vector2 class.
  RabbitTwo() : super(
    size: Vector2(200,100), 
    anchor: Anchor.centerRight,
    position: Vector2(screen_width-500, screen_height));

  double _initialAngle = 0;
  double fallSpeed = 0;
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('rabbit.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
     // Do something in response to a drag event
       position += event.localDelta;
      if (kDebugMode) {
        print('Dragging: ${event.localDelta}');
      } // Quick check to confirm it fires
     }

  @override
  void onScaleStart(ScaleStartEvent event) {
    super.onScaleStart(event);
    _initialAngle = angle;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    angle = _initialAngle + event.rotation;
  }

  @override
  void update(double dt) {
    super.update(dt);
      // Falling with gravity
      fallSpeed += 100 * dt;
      position.y -= fallSpeed * dt;
      if (kDebugMode) {
        print('position.y: ${position.y}');
      } // Debugging line to check the position of the rabbit  
      }


  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Do something in response to a tap event
    final currentParent = parent;
    if (currentParent is MyWorld) {
      currentParent.handleRabbitRemoved(this);
    } else {
      removeFromParent();
    }
    if (kDebugMode) {
      print('Removed Rabbit at: ${event.localPosition}');
    } // Quick check to confirm it fires
  }
}


class RabbitThree extends SpriteComponent with DragCallbacks,ScaleCallbacks,TapCallbacks {
  //no constructor parameters are needed because we are using the default constructor of the SpriteComponent class
  // which is a subclass of Component class which is a subclass of FlameGame class.
  // we have an initializer list that sets the size of the crate to 300 x 300 pixels using the Vector2 class.
  RabbitThree() : super(
    size: Vector2(200,100), 
    anchor: Anchor.centerRight,
    position: Vector2(screen_width-400, screen_height));

  double _initialAngle = 0;
  double fallSpeed = 0;
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('rabbit.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
     // Do something in response to a drag event
       position += event.localDelta;
      if (kDebugMode) {
        print('Dragging: ${event.localDelta}');
      } // Quick check to confirm it fires
     }

  @override
  void onScaleStart(ScaleStartEvent event) {
    super.onScaleStart(event);
    _initialAngle = angle;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    angle = _initialAngle + event.rotation;
  }

  @override
  void update(double dt) {
    super.update(dt);
      // Falling with gravity
      fallSpeed += 100 * dt;
      position.y -= fallSpeed * dt;
      if (kDebugMode) {
        print('position.y: ${position.y}');
      } // Debugging line to check the position of the rabbit  
      }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Do something in response to a tap event
    final currentParent = parent;
    if (currentParent is MyWorld) {
      currentParent.handleRabbitRemoved(this);
    } else {
      removeFromParent();
    }
    if (kDebugMode) {
      print('Tapped at: ${event.localPosition}');
    } // Quick check to confirm it fires
  }
}


class RabbitFour extends SpriteComponent with DragCallbacks,ScaleCallbacks,TapCallbacks {
  //no constructor parameters are needed because we are using the default constructor of the SpriteComponent class
  // which is a subclass of Component class which is a subclass of FlameGame class.
  // we have an initializer list that sets the size of the crate to 300 x 300 pixels using the Vector2 class.
  RabbitFour() : super(
    size: Vector2(200,100), 
    anchor: Anchor.centerRight,
    position: Vector2(screen_width-300, screen_height));

  double _initialAngle = 0;
  double fallSpeed = 0;
  
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('rabbit.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
     // Do something in response to a drag event
       position += event.localDelta;
      if (kDebugMode) {
        print('Dragging: ${event.localDelta}');
      } // Quick check to confirm it fires
     }

  @override
  void onScaleStart(ScaleStartEvent event) {
    super.onScaleStart(event);
    _initialAngle = angle;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    angle = _initialAngle + event.rotation;
  }

  //move the rabbit up and down with gravity
  @override
  void update(double dt) {
    super.update(dt);
      // Falling with gravity
      fallSpeed += 100 * dt;
      position.y -= fallSpeed * dt;
      if (kDebugMode) {
        print('position.y: ${position.y}');
      } // Debugging line to check the position of the rabbit  
      }

  //Make the Rabbit disappear when tapped
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Do something in response to a tap event
    final currentParent = parent;
    if (currentParent is MyWorld) {
      currentParent.handleRabbitRemoved(this);
    } else {
      removeFromParent();
    }
    if (kDebugMode) {
      print('Tapped at: ${event.localPosition}');
    } // Quick check to confirm it fires
  }
}

