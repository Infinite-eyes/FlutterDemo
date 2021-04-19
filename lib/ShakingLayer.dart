import 'dart:ui';

import 'package:flutter/rendering.dart';

class ShakingLayer extends ContainerLayer {
  int offset = 0;
  int step;

  ShakingLayer(this.step);

  void shake() {
    offset += step;
    if (offset >= 100 || offset <= -100) {
      step = -step;
    }
    markNeedsAddToScene();
  }

  @override
  EngineLayer addToScene(SceneBuilder builder,
      [Offset layerOffset = Offset.zero]) {
    final EngineLayer engineLayer =
        builder.pushOffset(layerOffset.dx + offset.toDouble(), layerOffset.dy);

    builder.pushOpacity((offset.abs().toDouble() * 256.0 / 100).toInt());

    super.addToScene(builder);
    builder.pop();
    builder.pop();
    return engineLayer;
  }
}
