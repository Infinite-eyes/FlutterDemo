import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/ShakingLayer.dart';

// https://xieguanglei.github.io/blog/post/flutter-code-chapter-01.html

void main() {
  // Canvas ->  PictureRecorder ->  Picture ->  SceneBuilder ->  Scene -> window
//v1 draw line
// PictureRecorder recorder = PictureRecorder();
// Canvas canvas = Canvas(recorder);
//
// Paint p = Paint();
// p.strokeWidth = 20.0;
// p.color = Color(0xFF00C4FF);
//
// canvas.drawLine(Offset(300, 300), Offset(800, 300), p);
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
// PictureRecorder recorder = PictureRecorder();
// Canvas canvas = Canvas(recorder);
// Paint p = Paint();
// p.strokeWidth = 30.0;
// p.color = Color(0xFF0099FF);
// canvas.drawLine(Offset(300, 300), Offset(800, 800), p);
// canvas.drawLine(Offset(800, 300), Offset(300, 800), p);
// Picture picCross = recorder.endRecording();
//
// window.onDrawFrame = () {
//
//   int i = DateTime.now().millisecond;
//   PictureRecorder recorder = PictureRecorder();
//   Canvas canvas = Canvas(recorder);
//   canvas.drawLine(Offset(i * 0.2, 550), Offset(1080 - i * 0.2, 550), p); //宽度便能话
//
//   Picture picLine = recorder.endRecording();
//
//   SceneBuilder sceneBuilder = SceneBuilder();
//   sceneBuilder.pushOffset(0, 0);
//   sceneBuilder.pushOpacity(128); //半透明度渲染
//   sceneBuilder.addPicture(new Offset(0, 0), picCross);
//   sceneBuilder.pop();
//   sceneBuilder.pushOffset(0, 0.5 * (i - 500)); //位移
//   sceneBuilder.addPicture(new Offset(0, 0), picLine);
//   sceneBuilder.pop();
//   sceneBuilder.pop();
//
//   Scene scene = sceneBuilder.build();
//   window.render(scene);
//   scene.dispose();
//   window.scheduleFrame();
//
// };
// window.scheduleFrame();

//v3
// PictureRecorder recorder = PictureRecorder();
// Canvas canvas = Canvas(recorder);
//
// Paint painterStroke = Paint();
// painterStroke.strokeWidth = 20.0;
// painterStroke.color = Color(0xFF0099FF);
// painterStroke.style = PaintingStyle.stroke;
//
// Paint painterFill = Paint();
// painterFill.color = Color(0xFF00D9FF);
// painterFill.style = PaintingStyle.fill;
//
// List<Offset> points = new List<Offset>(3);
// points[0] = new Offset(100.0, 200.0);
// points[1] = new Offset(300.0, 200.0);
// points[2] = new Offset(400.0, 200.0);
// canvas.drawPoints(PointMode.points, points, painterStroke);
// canvas.drawArc(
//     Rect.fromLTWH(100, 420, 200, 200),
//     0.0, 3.14*1.5, true, painterStroke
// );
// canvas.drawCircle(Offset(350, 350), 80, painterStroke);
// canvas.drawRect(Rect.fromLTWH(100, 700, 300, 100), painterFill);
//
// ParagraphBuilder paraBuilder = new ParagraphBuilder(new ParagraphStyle(
//   fontSize: 60,
// ));
// paraBuilder.addText(
//     "Flutter is Google’s UI toolkit for building beautiful, " +
//         "natively compiled applications for mobile, web, " +
//         "and desktop from a single codebase.\n");
// Paragraph prg = paraBuilder.build();
// print(prg.height.toString());
// prg.layout(new ParagraphConstraints(width: 900.0));
// print(prg.height.toString());
//
// canvas.drawParagraph(prg, new Offset(100, 900));
//
// Future<Codec> loadImage() async { //todo support web
//
//   HttpClient clt = HttpClient();
//   Uri resolved = Uri.base.resolve(
//       "http://img.alicdn.com/tfs/" +
//           "TB1_x5StSzqK1RjSZFpXXakSXXa-1024-1024.png"
//   );
//   HttpClientRequest request = await clt.getUrl(resolved);
//   HttpClientResponse response = await request.close();
//   Uint8List bytes = await consolidateHttpClientResponseBytes(response);
//   Codec cc = await instantiateImageCodec(bytes);
//   FrameInfo fif = await cc.getNextFrame();
//
//   canvas.drawImageRect(fif.image,
//       Rect.fromLTRB(
//           0, 0, fif.image.width.toDouble(), fif.image.height.toDouble()),
//       Rect.fromLTWH(500, 250, 500, 500), painterStroke);
//
//   Picture picture = recorder.endRecording();
//
//   SceneBuilder sceneBuilder = SceneBuilder();
//   sceneBuilder.pushOffset(0, 0);
//   sceneBuilder.addPicture(new Offset(0, 0), picture);
//   sceneBuilder.pop();
//   Scene scene = sceneBuilder.build();
//
//   window.onDrawFrame = (){
//     window.render(scene);
//   };
//   window.scheduleFrame();
// }
//
// loadImage();

// v4 layer
//   OffsetLayer rootLayer = new OffsetLayer();
//   PictureLayer pictureLayer = new PictureLayer(Rect.zero);
//
//   rootLayer.append(pictureLayer); //pictureLayer 作为子节点
//
//   pictureLayer.picture = createSolidRectanglePicture(Color(0xFF0090FF), 300, 300); //绘制矩形
//   rootLayer.updateSubtreeNeedsAddToScene(); //Layer 树进行一些状态更新
//
//   SceneBuilder sceneBuilder = SceneBuilder();
//   rootLayer.addToScene(sceneBuilder);
//   Scene scene = sceneBuilder.build();
//   window.onDrawFrame = (){
//     window.render(scene);
//   };
//   window.scheduleFrame();

//v5
//   OffsetLayer root = createLayerTree();
//   root.updateSubtreeNeedsAddToScene();
//
//   SceneBuilder sceneBuilder = SceneBuilder();
//   root.addToScene(sceneBuilder);
//   Scene scene = sceneBuilder.build();
//
//   window.onDrawFrame = () {
//     window.render(scene);
//   };
//   window.scheduleFrame();

// v6  验证 Layer 树渲染流程
//   OffsetLayer root = new OffsetLayer();
//   OffsetLayer animatedOffset = new OffsetLayer(offset: Offset(200, 200));
//   PictureLayer animatedLeaf = new PictureLayer(Rect.zero);
//   OffsetLayer target = new OffsetLayer(offset: Offset(200, 700));
//   ClipRRectLayer clip = new ClipRRectLayer(clipRRect: RRect.fromLTRBXY(0, 0, 500, 500, 220, 220));
//
//   PictureLayer leaf1 = new PictureLayer(Rect.zero);
//   PictureLayer leaf2 = new PictureLayer(Rect.zero);
//
//   root.append(animatedOffset);
//   animatedOffset.append(animatedLeaf);
//   root.append(target);
//   target.append(clip);
//   clip.append(leaf1);
//   clip.append(leaf2);
//
//   leaf1.picture = createSolidRectanglePicture(Color(0xFF00FF00), 500, 500);
//   leaf2.picture = createSolidRectanglePicture(Color(0xFF0000FF), 300, 300);
//
//   int count = 0;
//   int countLoop = 0;
//
//   void animate() {
//     countLoop = (countLoop + 1) % 100;
//     animatedLeaf.picture = createSolidRectanglePicture(Color(0xFFFF0000), 300.0 + countLoop, 300);
//     animatedOffset.offset = Offset(200, 200.0 + countLoop);
//   }
//
//   window.onDrawFrame = () {
//     animate();
//     count++;
//
//     SceneBuilder sceneBuilder = SceneBuilder();
//     root.updateSubtreeNeedsAddToScene();
//     if (count == 100) {
//       clip.remove();
//     }
//     root.addToScene(sceneBuilder);
//     Scene scene = sceneBuilder.build();
//
//     window.render(scene);
//     window.scheduleFrame();
//   };
//   window.scheduleFrame();

  //v7 SceneBuilder addRetained
  // EngineLayer layer;
  // int i = 0;
  //
  // window.onDrawFrame = () {
  //   i = (i + 1) % 100;
  //   Picture redPic =
  //       createSolidRectanglePicture(Color(0xFFFF0000), 200.0 + i, 200.0 + i);
  //   Picture bluePic =
  //       createSolidRectanglePicture(Color(0xFF00B7FF), 200.0 + i, 200.0 + i);
  //
  //   SceneBuilder sceneBuilder = SceneBuilder();
  //   sceneBuilder.pushOffset(0, 0);
  //   sceneBuilder.pushOffset(200, 200);
  //   sceneBuilder.addPicture(new Offset(0, 0), redPic);
  //   sceneBuilder.pop();
  //
  //   if (layer == null) {
  //     print('create layer');
  //     layer = sceneBuilder.pushOffset(300, 300);
  //     sceneBuilder.pushOpacity(128);
  //     sceneBuilder.addPicture(Offset.zero, bluePic);
  //     sceneBuilder.pop();
  //     sceneBuilder.pop();
  //   } else {
  //     print('add retained');
  //     sceneBuilder.addRetained(layer);
  //   }
  //
  //   sceneBuilder.pop();
  //   Scene scene = sceneBuilder.build();
  //   window.render(scene);
  //   window.scheduleFrame();
  // };
  // window.scheduleFrame();

//v8  ShakingLayer
//   OffsetLayer root = new OffsetLayer();
//
//   OffsetLayer offsetParent = new OffsetLayer(offset: Offset(300, 300));
//   ShakingLayer shakingLayer = new ShakingLayer(10);
//   PictureLayer offsetLeaf = new PictureLayer(Rect.zero);
//   root.append(offsetParent);
//   offsetParent.append(shakingLayer);
//   shakingLayer.append(offsetLeaf);
//   offsetLeaf.picture = createSolidRectanglePicture(Color(0xFFFF0000), 300, 300);
//
//   int i = 0;
//   window.onDrawFrame = () {
//     i = (i + 1) % 200;
//     offsetParent.offset = Offset(300, 300.0 + i * 3);
//     shakingLayer.shake();
//     root.updateSubtreeNeedsAddToScene();
//
//     SceneBuilder sceneBuilder = SceneBuilder();
//     root.addToScene(sceneBuilder);
//     Scene scene = sceneBuilder.build();
//     window.render(scene);
//     window.scheduleFrame();
//   };
//   window.scheduleFrame();

  //chapter-03  v9
  // PipelineOwner pipelineOwner = PipelineOwner();
  //
  // RenderView rv = RenderView(
  //     configuration: ViewConfiguration(
  //         size: window.physicalSize / window.devicePixelRatio,
  //         devicePixelRatio: window.devicePixelRatio),
  //     window: window);
  //
  // rv.attach(pipelineOwner);
  // rv.prepareInitialFrame();
  //
  // RenderDecoratedBox rrb = RenderDecoratedBox(
  //     decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 255)));
  //
  // window.onDrawFrame = (){
  //   pipelineOwner.flushLayout();
  //   pipelineOwner.flushCompositingBits();
  //   pipelineOwner.flushPaint();
  //   rv.compositeFrame();
  // };
  //
  // window.scheduleFrame();


  //v10
  PipelineOwner pipelineOwner = PipelineOwner();

  RenderView rv = RenderView(configuration: ViewConfiguration(
    size: window.physicalSize / window.devicePixelRatio,
    devicePixelRatio: window.devicePixelRatio,
  ), window: window);

  rv.attach(pipelineOwner);
  rv.prepareInitialFrame();

  RenderRepaintBoundary rrb = RenderRepaintBoundary();
  RenderStack rs = RenderStack(textDirection: TextDirection.ltr);

  RenderConstrainedBox rcb = RenderConstrainedBox(additionalConstraints: BoxConstraints.tight(Size(100,100)));
  RenderDecoratedBox rdb = RenderDecoratedBox(decoration: BoxDecoration(color: Color.fromARGB(255, 255, 0, 255)));

  rv.child = rrb;
  rrb.child = rs;
  rs.insert(rcb);
  rcb.child = rdb;

  window.onDrawFrame = (){
    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();
    rv.compositeFrame();
  };
  window.scheduleFrame();
  
  new Future.delayed(const Duration(milliseconds:3000),(){
    rcb.additionalConstraints =
        BoxConstraints.tight(Size(200,200));
    window.scheduleFrame();
  });




}

// https://juejin.cn/post/6844904051423838216
// void main() {
//   OffsetLayer rootLayer = new OffsetLayer();
//   PictureLayer pictureLayer = PictureLayer(Rect.zero);
//   rootLayer.append(pictureLayer);
//   pictureLayer.picture = createSolidRectanglePicture(Color(0xFFFF0000), 300, 200);
//   rootLayer.updateSubtreeNeedsAddToScene();
//   SceneBuilder sceneBuilder = SceneBuilder();
//   rootLayer.addToScene(sceneBuilder);
//   Scene scene = sceneBuilder.build();
//   window.onDrawFrame=(){
//     window.render(scene);
//   };
//   window.scheduleFrame();
// }

//base fun

Picture createSolidRectanglePicture(Color color, double width, double height) {
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder);
  Paint paint = Paint();
  paint.color = color;
  canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);
  return recorder.endRecording();
}

OffsetLayer createLayerTree() {
  // fun v1
  // OffsetLayer root = new OffsetLayer();
  // OffsetLayer offsetParent = new OffsetLayer(offset: Offset(300,300)); // OffsetLayer 位移layer
  // PictureLayer offsetLeaf = new PictureLayer(Rect.zero);
  // OffsetLayer transformParent = new TransformLayer(
  //     transform: Matrix4.rotationZ(0),offset: Offset(600,600)
  // );
  // PictureLayer transformLeadGreen = new PictureLayer(Rect.zero);
  // PictureLayer transformLeadBlue = new PictureLayer(Rect.zero);
  // root.append(offsetParent);
  // root.append(transformParent);
  // offsetParent.append(offsetLeaf);
  // transformParent.append(transformLeadGreen);
  // transformParent.append(transformLeadBlue);
  //
  // offsetLeaf.picture = createSolidRectanglePicture(Color(0xFFFF0000), 300, 300);
  // transformLeadGreen.picture = createSolidRectanglePicture(Color(0xFF00FF00), 500, 500);
  // transformLeadBlue.picture = createSolidRectanglePicture(Color(0xFF0000FF), 300, 300);
  //
  // return root;

  // fun v2
  // OffsetLayer root = new OffsetLayer();
  //
  // OffsetLayer backgroundParent = new OffsetLayer(offset:Offset(200,200));
  // PictureLayer backgroundLeaf = new PictureLayer(Rect.zero);
  // OffsetLayer foregroundParent = new OffsetLayer(offset: Offset(300,300));
  // OpacityLayer opacityParent= new OpacityLayer(alpha: 128);
  // PictureLayer foregroundLeaf = new PictureLayer(Rect.zero);
  //
  // root.append(backgroundParent);
  // root.append(foregroundParent);
  //
  // backgroundParent.append(backgroundLeaf);
  // foregroundParent.append(opacityParent);
  // opacityParent.append(foregroundLeaf);
  //
  // backgroundLeaf.picture = createSolidRectanglePicture(Color(0xFFFF0000), 300, 300);
  // foregroundLeaf.picture = createSolidRectanglePicture(Color(0xFF00FF00), 500, 500);
  //
  // return root;

  //fun v3
  OffsetLayer root = new OffsetLayer();
  OffsetLayer noClipParent = new OffsetLayer(offset: Offset(200, 200));
  PictureLayer noClipLeaf = new PictureLayer(Rect.zero);

  OffsetLayer clipRectParent = new OffsetLayer(offset: Offset(500, 200));
  ClipRectLayer clipRect =
  new ClipRectLayer(clipRect: Rect.fromLTWH(20, 20, 160, 160));

  PictureLayer clipRectLeaf = new PictureLayer(Rect.zero);
  OffsetLayer clipRRectParent = new OffsetLayer(offset: Offset(200, 600));
  ClipRRectLayer clipRRect = new ClipRRectLayer(
      clipRRect: RRect.fromLTRBR(20, 20, 160, 160, Radius.circular(20)));

  PictureLayer clipRRectLeaf = new PictureLayer(Rect.zero);
  OffsetLayer clipPathParent = new OffsetLayer(offset: Offset(500, 600));
  ClipPathLayer clipPath = new ClipPathLayer(clipPath: createPath());
  PictureLayer clipPathLeaf = new PictureLayer(Rect.zero);

  root.append(noClipParent);
  noClipParent.append(noClipLeaf);

  root.append(clipRectParent);
  clipRectParent.append(clipRect);
  clipRect.append(clipRectLeaf);

  root.append(clipRRectParent);
  clipRRectParent.append(clipRRect);
  clipRRect.append(clipRRectLeaf);

  root.append(clipPathParent);
  clipPathParent.append(clipPath);
  clipPath.append(clipPathLeaf);

  noClipLeaf.picture = createSolidRectanglePicture(Color(0xFFFF0000), 200, 200);
  clipRectLeaf.picture = noClipLeaf.picture;
  clipRRectLeaf.picture = noClipLeaf.picture;
  clipPathLeaf.picture = noClipLeaf.picture;
  return root;
}

Path createPath() {
  Path p = new Path();
  p.moveTo(0, 0);
  p.lineTo(200, 0);
  p.lineTo(0, 200);
  p.close();
  p.moveTo(100, 100);
  p.lineTo(200, 100);
  p.lineTo(100, 200);
  p.close();
  return p;
}
