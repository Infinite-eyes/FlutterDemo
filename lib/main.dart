import 'dart:ui';
import 'package:flutter/rendering.dart';

// https://xieguanglei.github.io/blog/post/flutter-code-chapter-01.html
void main() {
  //v1 draw line
  // PictureRecorder recorder = PictureRecorder();
  // Canvas canvas = Canvas(recorder);
  //
  // Paint p = Paint();
  // p.strokeWidth = 30.0;
  // p.color = Color(0xFFFF00FF);
  //
  // canvas.drawLine(Offset(300, 300), Offset(800, 800), p);
  // Picture picture = recorder.endRecording();
  //
  // SceneBuilder sceneBuilder = SceneBuilder();
  // sceneBuilder.pushOffset(0, 0);
  // sceneBuilder.addPicture(new Offset(0, 0), picture);
  // sceneBuilder.pop();
  // Scene scene = sceneBuilder.build();
  //
  // window.onDrawFrame = () {
  //   window.render(scene);
  // };
  // window.scheduleFrame();

  //v2
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder);
  Paint p = Paint();
  p.strokeWidth = 30.0;
  p.color = Color(0xFF0099FF);
  canvas.drawLine(Offset(300, 300), Offset(800, 800), p);
  canvas.drawLine(Offset(800, 300), Offset(300, 800), p);
  Picture picCross = recorder.endRecording();

  window.onDrawFrame = () {

    int i = DateTime.now().millisecond;
    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);
    canvas.drawLine(Offset(i * 0.2, 550), Offset(1080 - i * 0.2, 550), p);

    Picture picLine = recorder.endRecording();

    SceneBuilder sceneBuilder = SceneBuilder();
    sceneBuilder.pushOffset(0, 0);
    sceneBuilder.pushOpacity(128);
    sceneBuilder.addPicture(new Offset(0, 0), picCross);
    sceneBuilder.pop();
    sceneBuilder.pushOffset(0, 0.5 * (i - 500));
    sceneBuilder.addPicture(new Offset(0, 0), picLine);
    sceneBuilder.pop();
    sceneBuilder.pop();

    Scene scene = sceneBuilder.build();
    window.render(scene);
    scene.dispose();
    window.scheduleFrame();

  };
  window.scheduleFrame();
}
